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
    enabled   = bool
    namespace = string
  })
  default = {
    enabled   = false
    namespace = "default"
  }
}
