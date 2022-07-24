variable "name" {
  description = "Name to be used on all the resources as identifier"
  type        = string
  default     = ""
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC."
  type        = string
  default     = "0.0.0.0/0"
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}

variable "primary_dns" {
  description = "The dns for all subnets"
  type        = string
  default     = "100.125.1.250"
}

variable "secondary_dns" {
  description = "The dns for all subnets"
  type        = string
  default     = "100.125.128.250"
}

variable "public_subnet_name" {
  description = "This is public subnet name"
  type        = string
  default     = "public_subnet"
}

variable "public_subnet_cidr" {
  description = "This is cidr block for public subnet"
  type        = string
  default     = ""
}

variable "private_subnet_name" {
  description = "This is private subnet name"
  type        = string
  default     = "private_subnet"
}

variable "private_subnet_cidr" {
  description = "This is cidr block for private subnet"
  type        = string
  default     = ""
}

variable "database_subnet_name" {
  description = "This is database subnet name"
  type        = string
  default     = "database_subnet"
}

variable "database_subnet_cidr" {
  description = "This is cidr block for database subnet"
  type        = string
  default     = ""
}

variable "cce_subnet_name" {
  description = "This is cce subnet name"
  type        = string
  default     = "cce_subnet"
}

variable "cce_subnet_cidr" {
  description = "This is cidr block for cce subnet"
  type        = string
  default     = ""
}

variable "ingress_subnet_name" {
  description = "This is ingress subnet name"
  type        = string
  default     = "ingress_subnet"
}

variable "ingress_subnet_cidr" {
  description = "This is cidr block for ingress subnet"
  type        = string
  default     = ""
}

variable "egress_subnet_name" {
  description = "This is egress subnet name"
  type        = string
  default     = "egress_subnet"
}

variable "egress_subnet_cidr" {
  description = "This is cidr block for egress subnet"
  type        = string
  default     = ""
}

variable "egress_nat_gw_name" {
  description = "This is nat gateway for egress as default"
  type        = string
  default     = "egress_nat_gw"
}