provider "google" {
  credentials = file("google-credentials.json") # The service account JSON file
  project     = var.project_id                 # Using variable for project ID
  region      = var.region                     # Using variable for region
}

resource "google_compute_instance" "vm_instance" {
  name         = "example-vm"
  machine_type = var.machine_type
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    network = "default"
    access_config {}
  }
}
