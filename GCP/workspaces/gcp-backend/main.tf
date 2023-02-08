terraform {
  #############################################################
  ## AFTER RUNNING TERRAFORM APPLY (WITH LOCAL BACKEND)
  ## YOU WILL UNCOMMENT THIS CODE THEN RERUN TERRAFORM INIT
  ## TO SWITCH FROM LOCAL BACKEND TO REMOTE AWS BACKEND
  #############################################################
  backend "gcs" {
    bucket         = "bucket-terra-2-env-workspaces-geo" # REPLACE WITH YOUR BUCKET NAME
    prefix            = "terraform/backend/"
  }

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~>3.0"
    }
  }
}

# gcloud init 
# gcloud auth application-default login 
# billing

provider "google" {
  region  = "us-central1"
  project = "terra-2-env"
}


resource "google_storage_bucket" "terraform_state" {
  name          = "bucket-terra-2-env-workspaces-geo"
  location      = "US"
  force_destroy = true

  uniform_bucket_level_access = true

  #public_access_prevention = "enforced"

  versioning {
    enabled = true
  }


}
