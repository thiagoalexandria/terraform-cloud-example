# Defina um data source para obter a AMI do Amazon Linux
data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-2.*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

# Crie uma instância EC2
resource "aws_instance" "example" {
  ami           = data.aws_ami.amazon_linux.id
  instance_type = "t3a.micro"
  tags = {
    Name = "ec2-demo"
  }
}

# Saída do endereço IP público da instância EC2
output "public_ip" {
  value = aws_instance.example.public_ip
}