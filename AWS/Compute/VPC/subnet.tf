# Create a VPC 

resource "aws_vpc" "example" {
    cidr_block = "172.16.0.0/16"
  
}

# Create a subnet 
resource "aws_subnet" "demo" {
    vpc_id = aws_vpc.example.id
    cidr_block = "172.16.1.0/24"

    tags = {
      "Env" = "dev"
    }
  
}