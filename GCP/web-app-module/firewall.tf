resource "google_compute_firewall" "allow_http" {
    name = "allow-http-rule-${var.name_instance}"
    network = "default"
    
    allow {
      ports = ["80"]
      protocol = "tcp"
    }

    target_tags = ["allow-http-${var.name_instance}"]

    priority = 1000
  
}