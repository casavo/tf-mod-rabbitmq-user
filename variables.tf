variable "name" {
  type = string
}

variable "tags" {
  type    = list(string)
  default = []
}

variable "permissions" {
  type = map(object({
    read      = string
    write     = string
    configure = string
  }))
  default = {}
}

variable "kubernetes_secret" {
  type = object({
    enabled           = bool
    namespace         = string
    rabbitmq_protocol = string
    rabbitmq_host     = string
    rabbitmq_port     = string
  })
  default = {
    enabled           = false
    namespace         = "default"
    rabbitmq_protocol = "amqp"
    rabbitmq_host     = "localhost"
    rabbitmq_port     = "5672"
  }
}
