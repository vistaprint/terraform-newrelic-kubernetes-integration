# Description
Terraform infrastructure script to create kube-state-metric + New Relic infrastracture Kubernetes agent and link them in Google Kubernetes Engine (GKE)

# Usage
1) Using gcloud console, set the correct cluster kubectl config see https://cloud.google.com/sdk/gcloud/reference/container/clusters/get-credentials (this will be used by terraform to deploy the infrastructure)
2) Generate google service account credentials (need to have a Kubernetes role)
3) Run `terraform init`
4) Run `terraform apply`. This will deploy the resources outlined in the terraform file

# Variables

``` terraform
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
```
