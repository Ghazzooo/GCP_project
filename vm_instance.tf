resource "google_compute_instance" "private_vm" {
  name         = "private-vm-instance"
  machine_type = "e2-micro"
  zone         = "us-east4-b"
  allow_stopping_for_update = true

  depends_on = [
    google_container_cluster.private_cluster
   , google_container_node_pool.nodepool
  ]


   metadata_startup_script = <<-EOF
                                #
                                sudo apt install -y apt-transport-https ca-certificates gnupg
                                echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
                                curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo tee /usr/share/keyrings/cloud.google.gpg
                                sudo apt-get update && sudo apt-get install -y google-cloud-cli
                                sudo apt-get install kubectl
                                sudo apt-get install google-cloud-sdk-gke-gcloud-auth-plugin
                                gcloud container clusters get-credentials gke-cluster --zone us-east4-b --project my-project-ghazooo
                                  EOF

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2204-lts"
      size = 20
    
    }
  }
 
  network_interface {
    network = module.network.vpc_name
    subnetwork = module.network.subnet_name_1
  }
  service_account {
        email = google_service_account.final_service_account.email
        scopes = [ "cloud-platform" ] 
}

}