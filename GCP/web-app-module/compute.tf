resource "google_compute_instance" "apache" {
  name = var.name_instance
  zone = data.google_compute_zones.available_zones.names[0]
  tags = ["allow-http-${var.name_instance}"]

  machine_type = var.instance_type

  boot_disk {
    initialize_params {
      image = var.image_instance
    }
  }

  network_interface {
    network = "default"

    access_config {
      nat_ip = google_compute_address.static.address
    }
  }

  metadata_startup_script = file("startup_script.sh")
}

data "google_compute_zones" "available_zones" {}