resource "aws_instance" "master" {
  ami           = "ami-0620d12a9cf777c87"
  instance_type = "t2.micro"
  key_name                    = "home"
  vpc_security_group_ids      = "${var.security_group}"
  subnet_id                   = "${var.subnet1}"
  associate_public_ip_address = "true"
  connection {
    user = "ubuntu"
    key_file = "ssh/key"
  }
  provisioner "remote-exec" {
    inline = [
      "sudo su",
      "sudo apt-get update",
      "sudo apt-get install docker.io -y",
      "sudo service docker start",
      "sudo docker run -itd --name -p 80:80 nginx" 
      
    ]
  }
  provisioner "file" {
    source = "proj"
    destination = "/home/ubuntu/"
  }
  tags = { 
    Name = "master"
  }
}
