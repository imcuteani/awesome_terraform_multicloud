#resource block for aws vpc block

resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
  availability_zone = ["us-east-1b", "us-east-1c", "us-east-1e"]

  tags = {
    "name" = "vpc name resided in us_east_1 region"
  }
}





# Create the aws subnet resource block

resource "aws_default_subnet" "subnet_1" {
    availability_zone = aws_vpc.main.availability_zone
    vpc_id = aws_vpc.main.id
    cidr_block = "10.0.1.0/24"
    depends_on = [
      aws_vpc.main
    ]
}

resource "aws_default_subnet" "subnet_2" {
  availability_zone = ""
  vpc_id = aws_vpc.main.id
  cidr_block = "10.0.2.0/24"
  depends_on = [
    aws_vpc.main
  ]
}

tags = {
    name = "Default subnet for us-east-1 region"
}