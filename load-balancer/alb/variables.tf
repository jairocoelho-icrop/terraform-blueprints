# REQUIRED

variable "name" {
  description = "The name of the app"
  type        = string
}

variable "env" {
  description = "The environment to use"
  type        = string
}

variable "region" {
  description = "The AWS region to use"
  type        = string
}

variable "vpc_id" {
  type        = string
  description = "The VPC ID to use"
}

variable "subnets" {
  type        = list(string)
  description = "The subnets to use"
}

variable "target_groups" {
  type        = any
  description = "The target groups to use"
}

# OPTIONAL

variable "http_tcp_listeners" {
  type        = any
  description = "The HTTP listeners to use"
  default     = []
}

variable "https_listeners" {
  type        = any
  description = "The HTTP listeners to use"
  default     = []
}

variable "http_tcp_listener_rules" {
  type        = any
  description = "The HTTP listener rules to use"
  default     = []
}

variable "https_listener_rules" {
  type        = any
  description = "The HTTPS listener rules to use"
  default     = []
}

variable "extra_ssl_certs" {
  description = "A list of maps describing any extra SSL certificates to apply to the HTTPS listeners. Required key/values: certificate_arn, https_listener_index (the index of the listener within https_listeners which the cert applies toward)."
  type        = list(map(string))
  default     = []
}

variable "idle_timeout" {
  description = "The time in seconds that the connection is allowed to be idle."
  type        = number
  default     = 60
}

variable "tags" {
  description = "Additional tags to use"
  type        = map(string)
  default     = {}
}

variable "deregistration_delay" {
  description = "The amount of time to wait in seconds before changing the state of a deregistering target to unused"
  type        = number
  default     = 300
}
