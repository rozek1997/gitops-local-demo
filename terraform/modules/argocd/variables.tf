###########################
# Kubernetes variables
###########################
variable "cluster_ca_certificate" {
  type        = string
  description = "Base64 encoded root certificates bundle for TLS authentication."
}

variable "cluster_client_key" {
  type        = string
  description = "The bearer token to use for authentication when accessing the Kubernetes API. "
}

variable "cluster_client_certificate" {
  type        = string
  description = "The bearer token to use for authentication when accessing the Kubernetes API. "
}


variable "cluster_host" {
  type        = string
  description = "The hostname (in form of URI) of the Kubernetes API"
}

###########################
# ArgoCD variables
###########################

variable "argocd_version" {
  type        = string
  description = "ArgoCD helm charts version"
  default     = "5.6.0"
}

variable "argocd_root_configuration_path" {
  type        = string
  description = "Root configuration path for the apps of th apps pattern"
}

variable "argocd_configuration_git_repository" {
  type        = string
  description = "Root configuration for the apps of th apps pattern"
}