# Find the latest available AMI that is tagged with Component = ubuntu
# to see all details of ami-Id
# aws ec2 describe-images --region <eu-west-2> --image-ids <imageId from cattlog>

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  owners = ["099720109477"]
}