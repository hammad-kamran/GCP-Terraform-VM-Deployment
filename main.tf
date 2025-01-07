provider "google" {
  credentials =var.GOOGLE_CREDENTIALS  # Match variable name
  project     = var.project_id                # Match variable name
  region      = var.region                    # Match variable name
  zone        = var.zone                      # Match variable name
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
