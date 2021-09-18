# resource block for AWS EKS Security blocks

resource "aws_security_group" "worker_group_1" {
    name_prefix = "worker_group_1"
    vpc_id = aws_vpc.main.id

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"

        cidr_blocks = [
            "10.0.0.0/8"
        ]
    }
  
}

resource "aws_security_group" "worker_group_2" {
    name_prefix = "worker_group_2"
    vpc_id = aws_vpc.main.id

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"

        cidr_blocks = [
            "192.168.0.0/16"
        ]
    }
}

resource "aws_security_group" "all_worker_group" {
  name_prefix = "all_worker_group"
  vpc_id = aws_vpc.main.id

  ingress {
      from_port = 22
      to_port = 22
      protocol = "tcp"
  


        cidr_blocks = [
            "10.0.0.0/8",
            "172.16.0.0/12",
            "192.168.0.0/16"
        ]
    }
}

    
  
