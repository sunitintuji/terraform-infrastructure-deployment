
variable "instance_name" {
  description = "Name of the Lightsail instance"
}

variable "bundle_id" {
  description = "ID of the Lightsail instance bundle"
}

variable "blueprint_id" {
  description = "ID of the Lightsail instance blueprint"
}

variable "availability_zone" {
  description = "Name of the Lightsail key pair"
}

variable "associate_elastic_ip" {
  description = "Whether to associate an Elastic IP with the instance"
  default     = false
}

variable "env" {
  description = "Name of the Lightsail key pair"
}

variable "instance_tags" {
  description = "Tags for the Lightsail instance"
  type        = map(string)
  default     = {}
}

variable "instance_security_group" {
  default     = {}
  description = "A list of objects representing Lightsail instances with their respective security group configurations."
  type        = map(string)

}

variable "port_info" {
  type = list(object({
    protocol = string
    port     = number
    cidrs    = list(string)

  }))
  default = null
}
