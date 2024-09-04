provider "google" {
  project = var.project_id
  region  = var.region
}

module "network" {
  source  = "./modules/network"
  region  = var.region
}

module "gke" {
  source           = "./modules/gke"
  region           = var.region
  vpc_name         = module.network.vpc_name
  subnet_self_link = module.network.subnet_self_link
}

module "monitoring" {
  source            = "./modules/monitoring"
  project_id        = var.project_id
  notification_email = var.notification_email
}

module "iam" {
  source               = "./modules/iam"
  project_id           = var.project_id
  roles                = ["roles/container.admin", "roles/logging.viewer"]
  service_account_email = "gke-service-account@${var.project_id}.iam.gserviceaccount.com"
}
