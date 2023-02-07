resource "kubernetes_secret" "secret" {
  count = var.kubernetes_secret.enabled ? 1 : 0

  metadata {
    name      = "rabbitmq-${var.name}"
    namespace = var.kubernetes_secret.namespace
    labels = {
      "app.kubernetes.io/managed-by" = "Terraform"
    }
  }

  data = {
    RABBITMQ_USER     = var.name
    RABBITMQ_PASSWORD = random_password.password.result
  }
}
