resource "aws_network_acl" "private" {

  vpc_id = aws_vpc.this.id

  subnet_ids = aws_subnet.private[*].id

  tags = {
    Name = "${var.project_name}-${var.environment}-private-nacl"
  }

}