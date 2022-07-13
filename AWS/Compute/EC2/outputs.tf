output "aws_vpc_id" {
  value = aws_vpc.vpc.id
}

output "aws_subnet_id" {
  value = aws_subnet.subnet_public.id
}

output "aws_route_table_id" {
  value = aws_route_table.rtb_public.id
}

output "aws_instance_id" {
  value = aws_instance.web.id
}

output "public_ip" {
  value = aws_instance.web.public_ip
}