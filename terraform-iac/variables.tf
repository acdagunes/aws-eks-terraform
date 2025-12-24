# terraform-iac/variables.tf - AWS Variables

variable "aws_access_key" {
  description = "AWS Access Key ID"
  type        = string
  sensitive   = true
  default     = ""
}

variable "aws_secret_key" {
  description = "AWS Secret Access Key"
  type        = string
  sensitive   = true
  default     = ""
}

variable "region" {
  description = "AWS Region for resource deployment"
  type        = string
  default     = "eu-central-1"
}

variable "cluster_name" {
  description = "Name prefix for all resources"
  type        = string
  default     = "devops-demo"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}
