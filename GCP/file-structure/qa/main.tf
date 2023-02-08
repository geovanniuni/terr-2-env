terraform {
  #############################################################
  ## AFTER RUNNING TERRAFORM APPLY (WITH LOCAL BACKEND)
  ## YOU WILL UNCOMMENT THIS CODE THEN RERUN TERRAFORM INIT
  ## TO SWITCH FROM LOCAL BACKEND TO REMOTE AWS BACKEND
  #############################################################
  backend "gcs" {
    bucket         = "bucket-terra-2-env-file-geo" # REPLACE WITH YOUR BUCKET NAME
    prefix            = "terraform/qa/terraform.tfstate"
  }

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~>3.0"
    }
  }
}

provider "google" {
  region  = "us-central1"
  project = "terra-2-env"
}


#----------------------------------

locals {
  environment_name = "qa"
}

# -----------------------------------


module "web_app" {
  source = "../../web-app-module"

  # Input Variables
  name_instance    = "apache-${local.environment_name}"
  ip_name_static   = "ip-apache-${local.environment_name}"
}
