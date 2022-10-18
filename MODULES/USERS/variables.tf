variable "environment" {}

variable "user_names" {
  type = list(string)
  default = [
    "user1",
    "user2",
    "user3"
  ]
}

variable "create_users" {
  type = bool
  default = false
}