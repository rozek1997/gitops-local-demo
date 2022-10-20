module "kind" {
  source = "../../modules/kind"
}

module "argocd" {
  source = "../../modules/argocd"
  cluster_ca_certificate     = module.kind.kind_ca_certificate
  cluster_client_certificate = module.kind.kind_client_certificate
  cluster_client_key         = module.kind.kind_client_key
  cluster_host               = module.kind.kind_endpoint
  argocd_configuration_git_repository = "https://github.com/rozek1997/gitops-local-demo"
  argocd_root_configuration_path = "argocd/apps/staging"
}