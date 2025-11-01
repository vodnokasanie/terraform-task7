resource "aws_instance" "web_server" {
  ami           = "ami-0c94855ba95c71c99"  # example Amazon Linux 2 AMI in us-east-1; replace if needed
  instance_type = "t2.micro"
  
  subnet_id              = data.terraform_remote_state.base_infra.outputs.public_subnet_id
  vpc_security_group_ids = [data.terraform_remote_state.base_infra.outputs.security_group_id]

  tags = {
    Terraform = "true"
    Project   = var.project_id
  }
}
