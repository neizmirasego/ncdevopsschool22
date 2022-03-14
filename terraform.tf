#1 VIRTUAL MACHINE
resource "google_compute_instance" "vm_dev1" {
  name         = "dev1-from-gh"
  machine_type = "e2-small"
  zone        = "europe-central2-a"
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
  name         = "ci-l2-from-gh"
  machine_type = "e2-small"
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
