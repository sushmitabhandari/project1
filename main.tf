resource "aws_instance" "master" {
  ami           = "ami-0620d12a9cf777c87"
  instance_type = "t2.medium"
  key_name                    = "rama"
  security_groups      = ["sg-0d356f69a3363d363"]
  subnet_id                   = "subnet-0392c69b6c60966e5"
  associate_public_ip_address = "true"
  user_data = <<-EOF
		#!/bin/bash
                sudo su
		sudo apt-get update
		sudo touch /home/ubuntu/make.c
		sudo apt-get install docker.io -y
		sudo systemctl start docker.io
                sudo curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add
                sudo apt install curl
                sudo apt-add-repository "deb http://apt.kubernetes.io/ kubernetes-xenial main"
                sudo apt install kubeadm -y
                sudo swapoff -a
                sudo hostnamectl set-hostname master-node       
	EOF
  tags = { 
    Name = "master1"
  }
}
resource "aws_instance" "slave" {
  ami           = "ami-0620d12a9cf777c87"
  instance_type = "t2.micro"
  key_name                    = "rama"
  security_groups      = ["sg-0d356f69a3363d363"]
  subnet_id                   = "subnet-0392c69b6c60966e5"
  associate_public_ip_address = "true"
  user_data = <<-EOF
		#!/bin/bash
                sudo su
		sudo apt-get update
		sudo touch /home/ubuntu/make.c
		sudo apt-get install docker.io -y
		sudo systemctl start docker.io
                sudo curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add
                sudo apt install curl
                sudo apt-add-repository "deb http://apt.kubernetes.io/ kubernetes-xenial main"
                sudo apt install kubeadm -y
                sudo swapoff -a
                sudo hostnamectl set-hostname slave-node       
	EOF
  tags = { 
    Name = "slave1"
  }
}
