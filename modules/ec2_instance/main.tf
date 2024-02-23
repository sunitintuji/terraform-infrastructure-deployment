

resource "aws_instance" "ec2_instance" {
  count         = var.instance_count
  ami           = var.ami_id
  instance_type = var.instance_type
  availability_zone     = var.availability_zone
  key_name = var.key_name

  tags = {
    Name = "${var.name}-${var.env}"
  }
}

resource "aws_eip" "elastic_ip" {
  count    = var.associate_elastic_ip ? var.instance_count : 0
  instance = element(aws_instance.ec2_instance[*].id, count.index)
}


# output "ec2_instance_ids" {
#   value = aws_instance.ec2_instance[*].id
# }

# output "elastic_ip_addresses" {
#   value = aws_eip.elastic_ip[*].public_ip
# }