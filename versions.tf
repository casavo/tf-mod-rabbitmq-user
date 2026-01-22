terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 3.0.1"
    }
    rabbitmq = {
      source  = "cyrilgdn/rabbitmq"
      version = "~> 1.10.1"
    }
    random = {
      source = "hashicorp/random"
    }
  }
  required_version = ">= 1.0"
}
