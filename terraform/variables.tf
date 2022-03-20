variable "zone" {
  description = "GCP zone name"
  type        = string
  default     = "us-central1-a"
}

variable "network" {
  description = "network name"
  type        = string
  default     = "default"
}

variable "machine_type" {
  description = "GCP VM instance machine type"
  type        = string
  default     = "e2-small"
}

variable "registry_network_ip" {
  description = "regestry network_ip address."
  type        = string
  default     = "10.128.0.5"
}

variable "main_tags" {
  description = "tags list"
  type        = list(string)
  default     = ["tcp-8080"]
}

variable "registry_tags" {
  description = "tags list"
  type        = list(string)
  default     = ["tcp-5000"]
}

variable "registry_nat_ip" {
  description = "regestry nat_ip address."
  type        = string
  default     = "35.225.221.195"
}

variable "network_tier" {
  description = "network_tier name"
  type        = string
  default     = "PREMIUM"
}

variable "ssh_user" {
  description = "ssh username"
  type        = string
  default     = "lobofffailodrom"
}

variable "ssh_pub_key_file" {
  description = "ssh_pub_key_file name"
  type        = string
  default     = "key"
}
