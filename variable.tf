variable "public_key_file" {
  type        = string
  default     = "/home/ubuntu/publickey"
}

variable "master_instance_type"{
  type        = string
  default     = "t2.medium"
}

variable "worker_instance_type"{
  type        = string
  default     = "t2.micro"
}
