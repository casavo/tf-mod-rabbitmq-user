resource "random_password" "password" {
  length           = 24
  special          = true
  override_special = "_-!+"

  lifecycle {
    ignore_changes = [override_special]
  }
}

resource "rabbitmq_user" "user" {
  name     = var.name
  password = random_password.user_password.password.result
  tags     = var.tags
}

resource "rabbitmq_permissions" "permissions" {
  for_each = var.permissions

  user  = rabbitmq_user.user.name
  vhost = each.key

  permissions {
    read      = each.value.read
    write     = each.value.write
    configure = each.value.configure
  }

  depends_on = [
    rabbitmq_user.user
  ]
}
