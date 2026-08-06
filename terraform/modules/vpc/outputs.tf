output "vpc_id" {
  value = aws_vpc.this.id
}

output "vpc_cidr" {
  value = aws_vpc.this.cidr_block
}

output "internet_gateway_id" {

  description = "Internet Gateway ID"

  value = aws_internet_gateway.this.id

}


