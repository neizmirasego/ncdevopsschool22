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

variable "regestry_nat_ip" {
  description = "regestry nat_ip address."
  type        = string
  default     = "35.225.221.195"
}

variable "network_tier" {
  description = "network_tier name"
  type        = string
  default     = "PREMIUM"
}

variable "ssh_keys" {
  description = "ssh-keys data"
  type        = string
  default     = "lobofffailodrom:ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDYbR2t+mAILRS1ZjkT+T7WUgzhRFXh/AjwyxpthexVYmmjN1YB4otY08kJ1/i+f5Vo3jPLlIYRZMWcMnJ6e7slKUBEumrzsDhUWhwnZG4+F/eGyzm+18NIgjBbT40kflHL6/EbyxDm4cxU3DLKtjxJZHbj9iHS3PVWbJ/AKp11+sfIExdd7btcnHqtR3f1XZyyhxkiDas9qAwnsNnVp+nJp8bQpXifc4shEB4f2chcuPd+I6IK4+oEr8KKLcgB7fwrtJnINuESNuxjVdIYwXUPCiRGWnmF8bz63nOTDHgIKwUShL+2dWwz63MCJ4ZahddI2JnM/ocY5QTrltQ42GQdx1Y4leyXanzVw1wyXnK5q2y4MKl2d9JBRrS87K6yVL2+Juu8CRqBN8H64zmPKjwmEjvtqISb6fzWQUVVBLH29oI4TDKRkGkSTPptMB5WEJ8jWx0aWY3A9mdCg42YMyK/TLEcyXWj0ShgpEWOp9VvRyaMEx+EWvWAH3OWrXrZTPU= lobofffailodrom"
}
