provider "google" {
  credentials = file(var.credentials_file)

  project = var.project
  region  = var.region
  zone    = var.zone
}

provider "helm" {}

resource "google_compute_address" "kube_state_metric_address" {
  name = "kube-state-metrics-address"
  region = var.region
  project = var.project
}

resource "helm_release" "kube_state_metrics" {
  name  = "kube-state-metrics"
  chart = "stable/kube-state-metrics"

  set {
    name  = "service.type"
    value = "LoadBalancer"
  }

  set {
    name  = "service.loadBalancerIP"
    value = google_compute_address.kube_state_metric_address.address
    }
}

resource "helm_release" "newrelic_infra_agent" {
  name  = "newrelic-infra-agent"
  chart = "stable/newrelic-infrastructure"
  namespace = "newrelic-infra"
  timeout = 60 # seconds

  set {
    name  = "cluster"
    value = var.cluster_name
  }

    set {
    name  = "licenseKey"
    value = var.nria_license_key
  }

    set {
    name  = "kubeStateMetricsUrl"
    value = "http://${google_compute_address.kube_state_metric_address.address}:8080"
  }
}