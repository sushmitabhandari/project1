resource "aws_instance" "master" {
  ami           = "ami-0620d12a9cf777c87"
  instance_type = "t2.micro"
  key_name                    = "home"
  vpc_security_group_ids      = 
  subnet_id                   = "${aws_subnet.dwe-subnet.id}"
  associate_public_ip_address = "true"
  connection {
    user = "ubuntu"
    key_file = "ssh/key"
  }
  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update",
      "sudo apt-get install apt-transport-https ca-certificates",
      "sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D",
      "sudo sh -c 'echo \"deb https://apt.dockerproject.org/repo ubuntu-trusty main\" > /etc/apt/sources.list.d/docker.list'",
      "sudo apt-get update",
      "sudo apt-get install -y docker-engine=1.12.0-0~trusty",
      "sudo docker swarm init",
      "sudo docker swarm join-token --quiet worker > /home/ubuntu/token"
    ]
  }
  provisioner "file" {
    source = "proj"
    destination = "/home/ubuntu/"
  }
  tags = { 
    Name = "swarm-master"
  }
}
