
data "aws_iam_user" "cluster_admin" {
  user_name = var.user_name
}

data "aws_caller_identity" "current" {}

# Reference existing IAM role
data "aws_iam_role" "cluster_admin" {
  name = var.role_name
}

# /// users who will have access inside the cluster
# resource "aws_iam_group" "k8s_users_group" {
#   name = var.users  // i.e. "developers"
# }

# resource "aws_iam_role_policy_attachment" "eks_developer_access" {
#   policy_arn = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSClusterAdminPolicy"
#   role       = aws_iam_role.eks_access.name
# }

resource "aws_iam_group" "developers" {
  name = var.group_name
}

resource "aws_iam_group_membership" "developers" {
  name = "${var.group_name}-group-membership"
  
  users = [
    data.aws_iam_user.cluster_admin.user_name
  ]
  
  group = aws_iam_group.developers.name
}

# Add permission for user to assume the role
resource "aws_iam_user_policy" "cluster_admin_policy" {
  name = "cluster-admin-policy"
  user = data.aws_iam_user.cluster_admin.user_name

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = "sts:AssumeRole"
        Resource = data.aws_iam_role.cluster_admin.arn
      }
    ]
  }) 
}

module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "20.34.0" 

  cluster_name    = "${var.env}-private-cluster"
  cluster_version = var.cluster_version

  cluster_endpoint_public_access           = true
  enable_cluster_creator_admin_permissions = true

  access_entries = {
    cluster_admin = {
      principal_arn    = data.aws_iam_role.cluster_admin.arn

      policy_associations = {
        admin_policy = {
          policy_arn = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSClusterAdminPolicy"
          access_scope = {
            type = "cluster"  # Cluster-wide access
          }
        }
      }
    }

  }

  cluster_addons = {
    aws-ebs-csi-driver = {
      service_account_role_arn = module.irsa-ebs-csi.iam_role_arn
    }
    coredns = {
      most_recent = true
    }
    kube-proxy = {
      most_recent = true
    }
    vpc-cni = {
      most_recent = true
    }
  }

  vpc_id     = var.vpc // module.vpc.vpc_id
  subnet_ids =  var.public_subnets_ids // var.private_subnets_ids // IDs!

  eks_managed_node_group_defaults = {
    ami_type = "AL2_x86_64"

  }

  eks_managed_node_groups = {
    one = {
      name = "node-group-1"
      vpc_security_group_ids = var.public_ec2_sg_id //[aws_security_group.public_ec2_sg.id]
      instance_types = ["t3.small"]

      min_size     = 1
      max_size     = 3
      desired_size = 2
    }

    two = {
      name = "node-group-2"
      vpc_security_group_ids = var.public_ec2_sg_id
      instance_types = ["t3.small"]

      min_size     = 1
      max_size     = 2
      desired_size = 1
    }
  }
}

# https://aws.amazon.com/blogs/containers/amazon-ebs-csi-driver-is-now-generally-available-in-amazon-eks-add-ons/ 
data "aws_iam_policy" "ebs_csi_policy" {
  arn = "arn:aws:iam::aws:policy/service-role/AmazonEBSCSIDriverPolicy"
}

module "irsa-ebs-csi" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-assumable-role-with-oidc"
  version = "5.39.0"

  create_role                   = true
  role_name                     = "AmazonEKSTFEBSCSIRole-${module.eks.cluster_name}"
  provider_url                  = module.eks.oidc_provider
  role_policy_arns              = [data.aws_iam_policy.ebs_csi_policy.arn]
  oidc_fully_qualified_subjects = ["system:serviceaccount:kube-system:ebs-csi-controller-sa"]
}




# # Add these outputs to check the user's details
# output "cluster_admin_user_name" {
#   value = data.aws_iam_user.cluster_admin.user_name
# }

# output "cluster_admin_user_arn" {
#   value = data.aws_iam_user.cluster_admin.arn
# }

# output "cluster_admin_user_id" {
#   value = data.aws_iam_user.cluster_admin.id
# }
# output "cluster_admin_role_arn" {
#   value = data.aws_iam_role.cluster_admin.arn
# }