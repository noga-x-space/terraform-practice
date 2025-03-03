output "target_group_arn" {
  value       = module.application_load_balancer.web_tg.arn
}