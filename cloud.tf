provider "google" {
  project = "cdf-training-instance"
  region  = "us-central1"
}

resource "google_compute_instance" "e2-instance" {
  name         = "e2-instance"
  machine_type = "e2-standard-2"
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-10"
    }
  }

  network_interface {
    network = "default"
  }
}
