terraform {
  backend "s3" {
    bucket                  = "terraform-s3-state-noga"
    key                     = "dev/network/backend.tfstate"
    region                  = "us-east-1"
    shared_credentials_files = ["~/.aws/credentials"]
    profile                 = "sandbox-user" 
    encrypt= true
    dynamodb_table = "terraform-state-lock-dynamo"
  }
}
