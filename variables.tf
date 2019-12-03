variable "nria_license_key" {
  type = string
  description = "New relic license key. Can get this from New Relic account page."
}

variable "cluster_name" {
  type = string
  description = "Cluster name that the agent will use to group all metrics in new relic infrastructure"
}

variable "credentials_file" {
  type = string
  description = "GKE service account credential file, in JSON format."
}

variable "project" {
  type = string
  description = "GKE Project ID"
}

variable "region" {
  type = string
  description = "Desired google cloud region"
}

variable "zone" {
  type = string
  description = "Desired google cloud zone"
}
