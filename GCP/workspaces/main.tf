terraform {
  #############################################################
  ## AFTER RUNNING TERRAFORM APPLY (WITH LOCAL BACKEND)
  ## YOU WILL UNCOMMENT THIS CODE THEN RERUN TERRAFORM INIT
  ## TO SWITCH FROM LOCAL BACKEND TO REMOTE AWS BACKEND
  #############################################################
  backend "gcs" {
    bucket         = "bucket-terra-2-env-workspaces-geo" # REPLACE WITH YOUR BUCKET NAME
    prefix            = "terraform/workspaces/state/"
    #prefix            = "terraform/state/terraform.tfstate"
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
  environment_name = terraform.workspace
}

# -----------------------------------


module "web_app" {
  source = "../web-app-module"

  # Input Variables
  name_instance    = "apache-${local.environment_name}"
  ip_name_static   = "ip-apache-${local.environment_name}"
}
