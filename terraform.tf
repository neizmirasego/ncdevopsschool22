provider "google" {
  credentials = file("creds.json")
  project     = "gifted-monitor-338716"
  region      = "europe-central2"
  zone        = "europe-central2-a"
}
#1 VIRTUAL MACHINE
resource "google_compute_instance" "vm_dev1" {
  name         = "dev1"
  machine_type = "e2-small"
  boot_disk {
    initialize_params {
      size  = "20"
      image = "ubuntu-os-cloud/ubuntu-2004-lts"
    }
  }
  network_interface {
    network = "default"
    access_config {
    }
  }
}
#2 VIRTUAL MACHINE
resource "google_compute_instance" "vm_ci-l2" {
  name         = "ci-l2"
  machine_type = "e2-small"
  tags         = ["tcp-8080"]
  boot_disk {
    initialize_params {
      size  = "30"
      image = "ubuntu-os-cloud/ubuntu-2004-lts"
    }
  }
  network_interface {
    network = "default"
    access_config {
    }
  }
}
