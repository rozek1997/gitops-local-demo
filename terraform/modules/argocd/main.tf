resource "kubernetes_namespace" "argocd" {
  metadata {
    name = "argocd"
  }
}


resource "helm_release" "argocd" {
  chart      = "argo-cd"
  repository = "https://argoproj.github.io/argo-helm"
  name       = "argocd"
  namespace  = "argocd"
  version    = var.argocd_version

  set {
    name  = "configs.params.server.insecure"
    value = "true"
  }

  depends_on = [kubernetes_namespace.argocd]
}

resource "kubectl_manifest" "argocd_root_app" {
  yaml_body = templatefile("${path.module}/applications/application.yaml", {
    configuration_path = var.argocd_root_configuration_path
    configuration_git_repository = var.argocd_configuration_git_repository
  })

  depends_on = [helm_release.argocd]
}