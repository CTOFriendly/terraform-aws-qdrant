variable "region" {
  type = string
  default = "ap-south-1"
  description = "AWS region in which to deploy the Qdrant instance"
}

variable "instance_type" {
  type = string
  default = "t4g.micro"
  description = "AWS instance type to use for the Qdrant instance"
}

variable "key_name" {
  type = string
  default = "qdrant-key"
  description = "Name of the AWS key pair which will be generated to use for the Qdrant instance"
}

variable "disk_size" {
  type = number
  default = 30
  description = "Size of the root disk in GB"
}