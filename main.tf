module "kubeflow-metal" {
  source  = "kubeflow-onprem/kubeflow-metal/kustomize"
  version = "0.1.0-rc2"

  count_x86        = var.count_x86
  count_arm        = var.count_arm
  project_id       = var.project_id
  auth_token       = var.auth_token
  metro            = var.metro
  kubeflow_version = var.kubeflow_version
}


