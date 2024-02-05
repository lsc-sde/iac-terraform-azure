resource "azurerm_container_registry_task" "datascience_notebook" {
  name                  = "datascience-notebook"
  container_registry_id = var.container_registry_id
  platform {
    os = "Linux"
  }
  identity {
    type = "UserAssigned"
    identity_ids = [
        var.user_assigned_identity_id
    ]
  }


  tags = merge(var.tags, {
    "TF.Type" = "azurerm_container_registry_task"
    "TF.Resource" = "datascience_notebook"
    "TF.Module" = "container-registry-tasks",
  })

  registry_credential {
    source {
      login_mode = "Default"
    }
    custom {
      login_server = var.login_server
      identity = var.client_id
    }
  }

  docker_step {
    dockerfile_path      = "Dockerfile"
    context_path         = "https://github.com/lsc-sde/docker-datascience-notebook#${var.branch_name}"
    context_access_token = var.pat_token
    image_names          = ["datascience/datascience-notebook:{{.Run.ID}}"]
  }

  source_trigger {
    name = "datascience-notebook"
    events = ["commit"]
    repository_url = "https://github.com/lsc-sde/docker-datascience-notebook"
    source_type = "Github"
    branch = var.branch_name

    authentication {
      token = var.pat_token
      token_type = "PAT"
    }
  }
}

resource "azurerm_container_registry_task_schedule_run_now" "datascience_notebook" {
  count = var.run_now ? 1 : 0
  container_registry_task_id = azurerm_container_registry_task.datascience_notebook.id
}