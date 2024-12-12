provider "google" {
  credentials = jsondecode(var.gcp_credentials_file)  # Using raw JSON string passed via the environment variable
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

output "vm_public_ip" {
  value = google_compute_instance.vm_instance.network_interface[0].access_config[0].nat_ip
}
