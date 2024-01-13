provider "google" {
  project = "IaC_Sample"
  region  = "us-central1"
}

resource "google_compute_instance" "my_vm" {
  name         = "my-vm"
  machine_type = "g1-small"
  zone         = "us-central1-f"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    network = "default"
    access_config {
      // Ephemeral IP
    }
  }

  lifecycle {
    prevent_destroy = false
  }
}
