resource "aws_lightsail_instance" "lightsail_instance" {
  name           = "${var.instance_name}-${var.env}"
  bundle_id      = var.bundle_id
  blueprint_id   = var.blueprint_id
  availability_zone  = var.availability_zone
  tags = var.instance_tags


}

resource "aws_lightsail_static_ip" "static_ip" {
  count = var.associate_elastic_ip ? 1 : 0
  name  = "${var.instance_name}-static-ip"
}

resource "aws_lightsail_static_ip_attachment" "static_ip_attachment" {
  count          = var.associate_elastic_ip ? 1 : 0
  instance_name  = aws_lightsail_instance.lightsail_instance.name
  static_ip_name = aws_lightsail_static_ip.static_ip[0].name
}



resource "aws_lightsail_instance_public_ports" "public" {
  instance_name = aws_lightsail_instance.lightsail_instance.name

  dynamic "port_info" {
    for_each = var.port_info == null ? [] : var.port_info

    content {
      protocol  = port_info.value.protocol
      from_port = port_info.value.port
      to_port   = port_info.value.port
      cidrs     = port_info.value.cidrs


    }
  }
}

