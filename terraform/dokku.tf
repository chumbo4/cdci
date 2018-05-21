provider "aws" {
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  region     = "${var.region}"
}

resource "aws_instance" "example" {
  ami = "ami-43a15f3e"
  instance_type = "t2.micro"
  key_name = "chumboDokku"

  connection {
    type = "ssh"
    user = "ubuntu"
    private_key = "${file("${path.module}/chumboDokku.pem")}"
  }

   provisioner "file" {
    source = "./bootstrap.sh"
    destination = "/home/ubuntu/bootstrap.sh"
   }
   

   provisioner "remote-exec" {
      inline = [
        "chmod +x /home/ubuntu/bootstrap.sh",
        "sudo DOKKU_TAG=v0.12.7 bash /home/ubuntu/bootstrap.sh"
      ]	
   }

}

resource "aws_eip" "ip" {
  instance = "${aws_instance.example.id}"
}
