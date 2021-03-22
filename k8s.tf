resource "kubernetes_deployment" "kimai" {
  metadata {
    name = "kimai"
    labels = {
      appname = "kimai"
    }
  }

  spec {
    replicas = 2

    selector {
      match_labels = {
         appname = "timesheet-app"
      }
    }

    template {
      metadata {
        labels = {
          appname = "timesheet-app"
        }
      }

      spec {
        container {
          image = "kimai/kimai2:latest-dev"
          name  = "kimai"
          port {
             container_port = 8001
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "kimai-service" {
  metadata {
    name = "kimai-service"
  }
  spec {
    selector = {
      appname = "timesheet-app"
    }
    port {
      port        = 8001
      target_port = 8001
    }

    type = "LoadBalancer"
  }
}