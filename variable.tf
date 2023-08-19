variable "rgname" {}
variable "nsg1name" {}
variable "vnet1name" {}
variable "interface_name" {}
variable "nsgrule1name" {}
variable "devpip-name" {}
variable "location" {
  description = "region name to deploy the resources"
  default     = "EastUS"
}
variable "cidr" {
  description = "cidr values for the virtual network creation"
  default     = "10.0.0.0/16"
}
variable "subnetcidrs" {
  description = "cidr values for the subnet to avoid duplication of tje code"
  type        = list(string)
  default     = ["10.0.0.0/24", "10.0.1.0/24", "10.0.2.0/24"]
}
