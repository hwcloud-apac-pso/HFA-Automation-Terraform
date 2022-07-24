# variable "requester_region" {
#   description = "Requester Region"
#   type        = string
#   default     = ""
# }

variable "peering_region" {
  description = "peering Region"
  type        = string
  default     = ""
}


variable "requester_access_key" {
  description = "Requester AK"
  type        = string
  default     = ""
}

variable "requester_secret_key" {
  description = "Requester SK"
  type        = string
  default     = ""
}

variable "requester_vpc_name" {
  description = "Requester vpc name"
  type        = string
  default     = ""
}

variable "requester_vpc_id" {
  description = "Requester vpc id"
  type        = string
  default     = ""
}

variable "requester_vpc_cidr" {
  description = "The CIDR block for the Requester VPC."
  type        = string
  default     = "0.0.0.0/0"
}

# variable "accepter_region" {
#   description = "Accepter Region"
#   type        = string
#   default     = ""
# }
variable "accepter_access_key" {
  description = "Accepter AK"
  type        = string
  default     = ""
}
variable "accepter_secret_key" {
  description = "Accepter SK"
  type        = string
  default     = ""
}

variable "accepter_vpc_name" {
  description = "Accepter vpc name"
  type        = string
  default     = ""
}

variable "accepter_vpc_id" {
  description = "Accepter vpc id"
  type        = string
  default     = ""
}

variable "accepter_vpc_cidr" {
  description = "The CIDR block for the Accepter VPC."
  type        = string
  default     = "0.0.0.0/0"
}


### This variable can not get from data source , please check iam project/singapore 
variable "accepter_iam_region_project_id" {
  description = "The iam project uuid from region"
  type        = string
  default     = ""
}


### This variable for special cloud. Eg.  CAE and 
variable "requester_cloud_endpoint" {
  description = "The is endpoint."
  type        = string
  default     = null
}

variable "requester_sts" {
  description = "The is sts with AK/SK."
  type        = string
  default     = null
}

variable "accepter_cloud_endpoint" {
  description = "The is endpoint."
  type        = string
  default     = null
}

variable "accepter_sts" {
  description = "The is sts with AK/SK."
  type        = string
  default     = null
}