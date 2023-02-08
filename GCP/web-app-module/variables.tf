# Instance Variables
variable "name_instance" {
  description = "Name of the instance where the website is hosted"
  type        = string
}

variable "image_instance" {
  description = "GCP immage to deploy in the host"
  type        = string
  default     = "ubuntu-os-cloud/ubuntu-1804-lts"
}

variable "instance_type" {
  description = "instance type"
  type        = string
  default     = "e2-micro"
}


# IP


variable "ip_name_static" {
  description = "Name of the ip static of the websites"
  type        = string
}

