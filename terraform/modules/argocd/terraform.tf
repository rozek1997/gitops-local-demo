terraform {
  required_providers {
    helm = {
      source = "hashicorp/helm"
      version = "2.7.1"
    }

    kubernetes = {
      source = "hashicorp/kubernetes"
      version = "2.14.0"
    }

    kubectl = {
      source = "gavinbunney/kubectl"
      version = "1.14.0"
    }
  }
}

provider "kubectl" {
  host                   = var.cluster_host
  cluster_ca_certificate = var.cluster_ca_certificate
  client_certificate     = var.cluster_client_certificate
  client_key             = var.cluster_client_key
}

provider "kubernetes" {
  host                   = var.cluster_host
  cluster_ca_certificate = var.cluster_ca_certificate
  client_certificate     = var.cluster_client_certificate
  client_key             = var.cluster_client_key
}

provider "helm" {
  kubernetes {
    host                   = var.cluster_host
    cluster_ca_certificate = var.cluster_ca_certificate
    client_certificate     = var.cluster_client_certificate
    client_key             = var.cluster_client_key
  }
}