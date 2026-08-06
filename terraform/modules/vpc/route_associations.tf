#####################################
# Public Route Associations
#####################################

resource "aws_route_table_association" "public" {

  count = length(var.public_subnets)

  subnet_id = aws_subnet.public[count.index].id

  route_table_id = aws_route_table.public.id

}

#####################################
# Private Route Associations
#####################################

resource "aws_route_table_association" "private" {

  count = length(var.private_subnets)

  subnet_id = aws_subnet.private[count.index].id

  route_table_id = aws_route_table.private.id

}

#####################################
# Database Route Associations
#####################################

resource "aws_route_table_association" "database" {

  count = length(var.database_subnets)

  subnet_id = aws_subnet.database[count.index].id

  route_table_id = aws_route_table.database.id

}