
variable "name" {
  type        = string
  description = "The name of the node pool"
}

variable "vm_size" {
  type = string
}

variable "purpose" {
  type        = string
  description = "The purpose of the node pool"
}

variable "tags" {
  type        = map(string)
  description = "List of tags to generate"
}

variable "vnet_subnet_id" {
  type        = string
  description = "The subnet ID that these nodes will be attached to"
}

variable "max_pods" {
  type        = number
  description = "Maximum pods allowed on the node pool"
  default     = 110
}

variable "enable_auto_scaling" {
  type        = bool
  description = "Enables auto scaling on the node pool"
  default     = true
}

variable "node_count" {
  type        = number
  description = "Initial number of nodes"
  default     = 0
}

variable "min_count" {
  type        = number
  description = "Minimum number of nodes"
  default     = 0
}

variable "max_count" {
  type        = number
  description = "Maximum number of nodes"
  default     = 1
}

variable "node_taints" {
  type        = list(string)
  description = "Taints to apply against these nodes"
  default     = []
}

variable "node_labels" {
  type        = map(string)
  description = "Labels to apply against these nodes"
  default     = {}
}

variable "cluster_id" {
  type        = string
  description = "The ID of the kubernetes cluster"
}

variable "priority" {
  type        = string
  description = "The priority of the node pool. Possible values are Regular and Spot"
  default     = "Regular"
}
