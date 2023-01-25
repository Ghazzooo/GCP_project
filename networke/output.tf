output "vpc_name" {
value = google_compute_network.my_vpc.name 
}

output "subnet_name_1" {
  value = google_compute_subnetwork.management_subnet.name
}