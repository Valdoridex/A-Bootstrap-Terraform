variable "tags" {
  description = "A mapping of tags to assign to the resources"
  type        = map(string)
  default     = {}
}

variable "azure-location" {
  description = "The Azure region to deploy the resources to"
  type        = string
  default     = "West Europe"
}
