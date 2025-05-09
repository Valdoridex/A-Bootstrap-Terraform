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

variable "tenant-id" {
  description = "Azure Active Directory tenant. This value MUST be set!"
  type        = string
  default     = "00000000-0000-0000-0000-000000000000"
}

variable "subscription-id" {
  description = "Azure ASubscription id. This value MUST be set!"
  type        = string
  default     = "00000000-0000-0000-0000-000000000000"
}

variable "devops-application-name" {
  description = "Valdoridex DevOps agent identity as an Azure Intra ID application"
  type        = string
  default     = "Vdx-DevOps-Agent"
}

variable "devops-application-user-name" {
  description = "Valdoridex DevOps agent user name"
  type        = string
  default     = "SP-Vdx-DevOps-Agent"
}
