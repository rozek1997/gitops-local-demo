terraform {
  required_providers {
    kind = {
      source = "tehcyx/kind"
      version = "0.0.14"
    }
  }
}

provider "kind" {
  # Configuration options
}

resource "kind_cluster" "default" {
  name = "demo-cluster"
  node_image = "kindest/node:v1.21.14"
  wait_for_ready = true
  kind_config {
    kind        = "Cluster"
    api_version = "kind.x-k8s.io/v1alpha4"

    node {
      role = "control-plane"

      kubeadm_config_patches = [
        "kind: InitConfiguration\nnodeRegistration:\n  kubeletExtraArgs:\n    node-labels: \"ingress-ready=true\"\n"
      ]

      extra_port_mappings {
        container_port = 443
        host_port      = 2000
      }

    }

    node {
      role = "worker"
    }

    node {
      role = "worker"
    }
  }
}