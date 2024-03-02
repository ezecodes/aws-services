output "vpc_id" {
  value = aws_vpc.vpc.id
}
output "route_table_id" {
  value = aws_route_table.route_table.id
}
output "primary_public_subnet_id" {
  value = aws_subnet.primary_public_subnet
}
output "secondary_public_subnet_id" {
  value = aws_subnet.secondary_public_subnet
}
output "primary_private_subnet_id" {
  value = aws_subnet.primary_private_subnet
}
output "secondary_private_subnet_id" {
  value = aws_subnet.secondary_private_subnet
}
output "internet_gateway_id" {
  value = aws_internet_gateway.internet_gateway.id
}