variable "project-name" {
  type        = string
  description = "Enter project name"
}

variable "Environment" {
  type        = string
  description = "Enter environment"
}

variable "vpc_id" {
  type        = string
  description = "Enter vpc_id"
}

variable "web_port"{
  type        = number
  description = "Enter web_port"
}

variable "ssh_port"{
  type        = number
  description = "Enter ssh_port"
}

variable "protocol" {
   type        = string
   default     = "tcp"
}

variable "tags" {
  type        = map(string)
  description = "Extra tags to attach to the resources"
}

variable "rds_port" {
   type        = number
   description = "Enter from_port"
}

/* variable "name_rds_sg" {
   type        = string
   description = "Enter name_prefix"
} */
