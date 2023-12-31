variable "vpc_variable" {
  type = map(any)
}
variable "region" {
  type = string
}
variable "common_tags" {
  type = any
}

variable "project-name" {
  type = string
}

variable "Environment" {
  type = string
}

variable "web_port" {
  type = number
}

variable "ssh_port" {
  type = number
}

variable "rds_port" {
  type = number 
}

variable "name_rds_sg" {
  type = string
}

variable "internal" {
  type    = bool
  default = false
}

variable "load_balancer_type" {
  type = string
}

variable "deletion_protection" {
  type    = bool
  default = false
}

variable "target_type" {
  type    = string
  default = "instance"
}

variable "instance_type" {
  type = string
}

variable "key_name" {
  type = string
}

variable "instance_profile" {
  type    = string
#  default = "arn:aws:iam::528519205020:instance-profile/msr-ec2-fullacees-role"
  default = "arn:aws:iam::750725077702:instance-profile/EC2FullAccess"
}

variable "min_size" {
  type = number
}

variable "desired_capacity" {
  type = number
}

variable "max_size" {
  type = number
}


#========== RDS Variables ========================

variable "db_subnet_group_name" {
  type        = string
  description = "Enter db_subnet_group_name"
}

variable "engine" {
   type        = string
   description = "Enter engine"
}

variable "instance_class" {
   type        = string
   description = "Enter instance_class "
}

variable "allocated_storage" {
   type        = number
   description = "Enter allocated_storage" 
}

variable "identifier" {
   type        = string
   description = "Enter identifier"
}

variable "db_name" {
   type        = string
   description = "Enter db_name"   
}

variable "username" {
   type        = string
   description = "Enter username"
}

variable "skip_final_snapshot" {
   type        = bool
   description = "Enter skip_final_snapshot"
}

variable "multi_az" {
   type        = bool
   description = "Enter multi_az"
}

