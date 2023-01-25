resource "google_compute_router_nat" "nat_getway" {
  name = "my-nat"
  router = google_compute_network.my_vpc.id
}

