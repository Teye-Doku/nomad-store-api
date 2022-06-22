variable "cidr_vpc" {
  description = "CIDR block for the vpc"
  default =  "10.0.0.0/16"
}
variable "cidr_public_subnet_1" {
  description = "CIDR block for public subnet 1"
  default =  "10.0.0.0/24"
}
variable "cidr_public_subnet_2" {
  description = "CIDR block for public subnet 2"
  default =  "10.0.1.0/24"
}
variable "cidr_public_subnet_3" {
  description = "CIDR block for public subnet 3"
  default =  "10.0.3.0/24"
}

variable "cluster_name" {
  type = string
  description = "The name of the cluster"
}

variable "stripe_secret_key" {
  type = string 
  description = "The secret for stripe"
}
variable "web_app_url" {
  type = string
  description = "The web app url to redirect the user after payment"
}
variable "web_hook_secret" {
  type = string 
  description = "stripe webhook secret"
}
variable "server_port" {
  description = "The server uses this port"
  default = 8080
}

variable "instance_type" {
  description = "The type of the instance to run"
  type = string
  default = "t2.micro"
}

variable "min_size" {
  type = number
  description = "The minimum number of instances in asg"
}
variable "max_size" {
  type = number
  description = "The maximum number of instances in asg"
}

variable "log_profile_name" {
  description = "log profile for aws instance"
}

variable "dns_name" {
  type =  string
}
variable "dns_hosted_zone" {
  type = string
}