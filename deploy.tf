resource "kubernetes_deployment" "java" {
  metadata {
    name = "dev-group-node"
    labels = {
      app  = "dev-group-node"
    }
  }
spec {
    replicas = 2
selector {
      match_labels = {
        app  = "dev-group-node"
      }
    }
template {
      metadata {
        labels = {
          app  = "dev-group-node"
        }
      }
spec {
        container {
          image = "749233386023.dkr.ecr.us-east-1.amazonaws.com/java-app:latest"
          name  = "dev-group-node"
          port {
            container_port = 8080
         }
        }
      }
    }
  }
}
resource "kubernetes_service" "java" {
  depends_on = [kubernetes_deployment.java]
  metadata {
    name = "dev-group-node"
  }
  spec {
    selector = {
      app = "dev-group-node"
    }
    port {
      port        = 80
      target_port = 8080
    }
type = "LoadBalancer"
}
}

####Jenkins

resource "kubernetes_deployment" "jenkins" {
  metadata {
    name = "jenkins"
    labels = {
      app  = "jenkins"
    }
  }
  spec {
    replicas = 1
      selector {
        match_labels = {
          app  = "jenkins"
        }
      }
    template {
      metadata {
        labels = {
          app  = "jenkins"
        }
      }
      spec {
        container {
          image = "jenkins/jenkins"
          name  = "jenkins"
          port {
            container_port = 8080
         }
          volume_mount {
            mount_path = "/var/jenkins_home"
            name       = "jenkins-storage"
          }
       
        }
         volume {
        name = "jenkins-storage"

          empty_dir {}
        }
      }
    }
  }
}

resource "kubernetes_service" "jenkins" {
  depends_on = [kubernetes_deployment.jenkins]
  metadata {
    name = "jenkins"
  }
  spec {
    selector = {
      app = "jenkins"
    }
    port {
      port        = 80
      target_port = 8080
    }
    type = "LoadBalancer"
  }
}


