resource "aws_instance" "master" {
  ami           = "ami-0620d12a9cf777c87"
  instance_type = "t2.micro"
  key_name                    = "home"
  security_groups      = ["sg-0659fb504c0a46352"]
  subnet_id                   = "subnet-001d87dc84073b441"
  associate_public_ip_address = "true"
  user_data = "3bb87e481fbaf94b8e"
  tags = { 
    Name = "master1"
  }
}
