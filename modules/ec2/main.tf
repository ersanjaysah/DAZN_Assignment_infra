resource "aws_instance" "myec2" {
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = var.instance_type_ami
  key_name                    = aws_key_pair.my_key_pair.key_name
  vpc_security_group_ids = [var.mysg_id]
  associate_public_ip_address = true
  subnet_id = var.public_subnet_id
  monitoring = true
  user_data = var.userdata

  tags = {
    Name = var.tag_name
    env = "QA"
  }

}
resource "aws_key_pair" "my_key_pair" {
  key_name   = "my-key-pair"
  public_key = var.publickey  
}

resource "null_resource" "name" {
  # ssh into the ec2 instance
  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("my-key-pair")
    host        = aws_instance.myec2.public_ip
  }

  # copy the "pull_docker_image.sh" file from our computer to ec2 instance 
  provisioner "file" {
    source      = "./modules/ec2/pull_docker_image.sh"
    destination = "/home/ubuntu/pull_docker_image.sh"
  }

  # set permission and run the build_docker_image.sh file
  provisioner "remote-exec" {
    inline = [
      "sudo chmod +x /home/ubuntu/pull_docker_image.sh",
      "sh /home/ubuntu/pull_docker_image.sh",
    ]
  }

  # wait for ec2 to be created
  depends_on = [aws_instance.myec2]
}

# print the url of the container server
output "container_url" {
  value = join("", ["http://", aws_instance.myec2.public_dns])
}