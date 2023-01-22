variable "vpc_cidr" {
  default     = "10.0.0.0/16"
  description = "Choose the cidr_block"
  type        = string
}

variable "region" {
  default     = "us-east-1"
  description = "Choose the region"
  type        = string
}