# output.tf
output "lightsail_instanceone_id" {
  description = "Name of the Lightsail instance"
  value       = module.lightsailinstanceone.lightsail_instance_id
  
}

output "instanceone_staticip" {
  description = "Name of the Lightsail instance elastic ip"
  value       = module.lightsailinstanceone.staticip
}


output "lightsail_instancetwo_id" {
  description = "Name of the Lightsail instance"
  value       = module.lightsailinstancetwo.lightsail_instance_id
  
}

output "instancetwo_staticip" {
  description = "Name of the Lightsail instance elastic ip"
  value       = module.lightsailinstancetwo.staticip
}