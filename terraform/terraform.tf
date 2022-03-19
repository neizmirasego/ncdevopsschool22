#1 VIRTUAL MACHINE
resource "google_compute_instance" "vm_dev1" {
  name         = "dev1-gh"
  machine_type = var.machine_type
  zone         = var.zone
  boot_disk {
    initialize_params {
      size  = "20"
      image = "ubuntu-os-cloud/ubuntu-2004-lts"
    }
  }
  network_interface {
    network = var.network
    access_config {
    }
  }
  metadata = {
    ssh-keys = var.ssh_keys
  }
}
#2 VIRTUAL MACHINE
resource "google_compute_instance" "vm_ci_l2" {
  name         = "ci-l2-gh"
  machine_type = var.machine_type
  zone         = var.zone
  tags         = ["tcp-8080"]
  boot_disk {
    initialize_params {
      size  = "30"
      image = "ubuntu-os-cloud/ubuntu-2004-lts"
    }
  }
  network_interface {
    network = var.network
    access_config {
    }
  }
  metadata = {
    ssh-keys = var.ssh_keys
  }
}
#3 VIRTUAL MACHINE
resource "google_compute_instance" "registry" {
  name         = "registry"
  machine_type = var.machine_type
  zone         = var.zone
  tags         = var.tags
  boot_disk {
    initialize_params {
      size  = "30"
      image = "ubuntu-os-cloud/ubuntu-2004-lts"
    }
  }
  network_interface {
    network    = var.network
    network_ip = var.network_ip
    access_config {
      nat_ip       = var.nat_ip
      network_tier = var.network_tier
    }
  }
  metadata = {
    ssh-keys = var.ssh_keys
  }
}
output "registry_ip" {
  value = google_compute_instance.registry.network_interface.0.access_config.0.nat_ip
}
output "vm_dev1_ip" {
  value = google_compute_instance.vm_dev1.network_interface.0.access_config.0.nat_ip
}
output "vm_ci_l2_ip" {
  value = google_compute_instance.vm_ci_l2.network_interface.0.access_config.0.nat_ip
}
