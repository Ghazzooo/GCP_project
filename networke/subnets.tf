resource "google_compute_subnetwork" "management_subnet" {
    name = var.subnet_name_1
    ip_cidr_ip_cidr_range = var.subnet_cidr_1
    region = "us-east4"
    network = google_compute_network.my_vpc.id
    private_ip_google_access = true
}

resource "google_compute_subnetwork" "restricted_subnet" {
    name = var.subnet_name_2
    ip_cidr_ip_cidr_range = var.subnet_cidr_2
    region = "us-east4"
    network = google_compute_network.my_vpc.id
    private_ip_google_access = true
}