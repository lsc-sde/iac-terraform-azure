module "datascience_notebook" {
    source = "../container-registry-gitops"

    container_registry_id = var.container_registry_id
    branch_name = var.branch_name
    pat_token = var.pat_token
    repository_name = "docker-datascience-notebook"
    image_name = "datascience-notebook"
    category_name = "jupyter-images"
    tags = var.tags
}