# output "lightsail_instance_id" {
#   description = "ID of the Lightsail instance"
#   value       = aws_lightsail_instance.lightsail_instance.id
# }

# output "staticip" {
#   description = "Name of the Lightsail instance elastic ip"
#   value       = aws_lightsail_static_ip.static_ip[*].id
#  }


output "ec2_instance_ids" {
  value = aws_instance.ec2_instance[*].id
}

output "elastic_ip_addresses" {
  value = aws_eip.elastic_ip[*].public_ip
}