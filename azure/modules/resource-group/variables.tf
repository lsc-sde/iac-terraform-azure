variable "location" {
    type = string
    description = "The location to setup resources"
}

variable "name" {
    type = string
    description = "Name of the cluster"
    default = ""
}

variable "prefix" {
    type = string
    description = "Naming Prefix"
    default = ""
}

variable tags {
    type = map(string)
    description = "List of tags to generate"
}
