variable "region" {
  description = "Region"
  type        = string
  default     = ""
}
variable "collected_account_name" {
  description = "Colllected Account Name"
  type        = string
  default     = ""
}

variable "collected_access_key" {
  description = "Collected AK"
  type        = string
  default     = ""
}

variable "collected_secret_key" {
  description = "Collected SK"
  type        = string
  default     = ""
}



variable "centralized_account_name" {
  description = "Centralized Account Name"
  type        = string
  default     = ""
}

variable "centralized_access_key" {
  description = "Centralized AK"
  type        = string
  default     = ""
}
variable "centralized_secret_key" {
  description = "Centralized SK"
  type        = string
  default     = ""
}

variable "cts_centralized_rotation_days" {
  description = "cts centralized rotation days"
  type        = string
  default     = ""
}