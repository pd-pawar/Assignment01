variable "profile" {
    default = "default" 
}
variable "region"{
    default = "us-east-1"
}
variable "eks_module_version" {  
   default = "12.2.0"
}
variable "vpc_module_version" {
   default = "2.6.0"  
}
variable "cluster_name" {
  default = "eks-getting-started"
}

variable "vpc_cidr" {
}
variable "public_subnet_count" {
  description = "Number of public subnets."
  type        = number
  default     = 2
}

variable "private_subnet_count" {
  description = "Number of private subnets."
  type        = number
  default     = 2
}

variable "public_subnet_cidr_blocks" {
  description = "Available cidr blocks for public subnets."
  type        = list(string)
  default     = [
    "10.0.1.0/24",
    "10.0.2.0/24",
    "10.0.3.0/24",
    "10.0.4.0/24",
    "10.0.5.0/24",
    "10.0.6.0/24",
    "10.0.7.0/24",
    "10.0.8.0/24",
  ]
}

variable "private_subnet_cidr_blocks" {
  description = "Available cidr blocks for private subnets."
  type        = list(string)
  default     = [
    "10.0.101.0/24",
    "10.0.102.0/24",
    "10.0.103.0/24",
    "10.0.104.0/24",
    "10.0.105.0/24",
    "10.0.106.0/24",
    "10.0.107.0/24",
    "10.0.108.0/24",
  ]
}

variable "eks_cluster_version"{
   default = "1.17"
}

variable "worker_group_name"{
  default = "worker-group-1"
}
variable "instance_type"{
  default = "t2.small"
}
variable "asg_desired_capacity"{
  default = 1
}