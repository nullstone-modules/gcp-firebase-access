resource "google_project_iam_member" "firebase_auth_admin" {
  project = local.project_id
  role    = "roles/firebaseauth.admin"
  member  = "serviceAccount:${local.service_account_email}"

  count = var.read_only ? 0 : 1
}

resource "google_project_iam_member" "firebase_auth_viewer" {
  project = local.project_id
  role    = "roles/firebaseauth.viewer"
  member  = "serviceAccount:${local.service_account_email}"

  count = var.read_only ? 1 : 0
}
