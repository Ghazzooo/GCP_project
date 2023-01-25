resource "google_project_iam_custom_role" "my_role" {
  role_id = "myRole"
  title = "my role"
  permissions = ["resourcemanager.projects.get", "storage.buckets.get", "storage.buckets.list" , "storage.objects.get" , "storage.objects.list" ,
   "container.deployments.get" , "container.deployments.create" , "container.deployments.list" , "container.services.list" , "container.services.get" ,
    "container.services.create" , "container.clusters.list" , "container.clusters.getCredentials" , "container.clusters.get" , "container.pods.list" ,
     "container.nodes.list" ]
}

resource "google_service_account" "project-service-account" {
  account_id = "project-service-account"
  project = "my-project-ghazooo"
}

resource "google_project_iam_binding" "service-account-iam-1" {
  project = "my-project-ghazooo"
  role    = "roles/storage.admin"
  members = [
    "serviceAccount:${google_service_account.project-service-account.email}"
  ]
}

resource "google_project_iam_binding" "service-account-iam-1" {
  project = "my-project-ghazooo"
  role    = "projects/${google_service_account.project-service-account.project}/roles/${google_project_iam_custom_role.my_role.role_id}"
  members = [
    "serviceAccount:${google_service_account.project-service-account.email}"
  ]
}