resource "google_compute_firewall" "ssh_firewall" {
  project = "my-project-ghazooo"
  name = "ssh-firewall"
  network = var.vpc_name
  direction = "INGRESS"
  source_ranges = [ "0.0.0.0/0" ]

  depends_on = [
    module.network
  ]

  allow {
    protocol = "tcp"
    ports = ["22"]
  }



}
