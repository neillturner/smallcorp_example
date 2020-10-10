variable "name_prefix" {
    default = "dev"
    description = "Name prefix for this environment."
}

variable "allow_ssh" {
    default = true
    description = "allow ssh to instance via port 22."
}

