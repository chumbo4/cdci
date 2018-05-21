variable "access_key" {default = ""}
variable "secret_key" {default = ""}
variable "region" {
  default = "us-east-1"
}
variable "private_key" {
  default = "${file(${path.module}/chumboDokku.pem)}"
}
