provider "google" {
  credentials = jsondecode(var.GOOGLE_CREDENTIALS_JSON)  # Use jsondecode to parse the raw JSON string
  project     = var.project_id
  region      = var.region
}

resource "google_compute_instance" "vm_instance" {
  name         = "terraform-vm"
  machine_type = "e2-medium"
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11-bullseye-v20210916"
    }
  }

  network_interface {
    network = "default"
    access_config {
      // Assigns a public IP address
    }
  }
}

