provider "aws" {
  region = var.region
}

terraform {
  backend "s3" {}
}

locals {
  name = "${var.env}-${var.name}"
  tags = merge(var.tags, {
    Environment = var.env
    ManagedBy   = "Terraform"
  })
}

module "alb" {
  source  = "terraform-aws-modules/alb/aws"
  version = "~> 6.0"

  name               = local.name
  load_balancer_type = "application"

  vpc_id          = var.vpc_id
  subnets         = var.subnets
  security_groups = [module.security_group_elb.security_group_id]
  idle_timeout    = var.idle_timeout

  target_groups           = [for tg in var.target_groups : merge(tg, { deregistration_delay = var.deregistration_delay })]
  http_tcp_listeners      = var.http_tcp_listeners
  http_tcp_listener_rules = var.http_tcp_listener_rules
  https_listeners         = var.https_listeners
  https_listener_rules    = var.https_listener_rules
  extra_ssl_certs         = var.extra_ssl_certs

  tags = local.tags
}

locals {
  # Add tag environment to target groups
  target_groups = [for tg in var.target_groups : merge(tg, { tags = merge(tg.tags, { Environment = var.env }) })]
  # Create a map of target group names to ARNs
  target_group_arns_by_name = { for i, tg in var.target_groups : tg.tags.Application => module.alb.target_group_arns[i] }
}
