output "registry_ip" {
  value = google_compute_instance.registry.network_interface.0.access_config.0.nat_ip
}
output "ci_ip_address" {
  value = [ 
    for vm in google_compute_instance.ncdev :
   "VM: ${vm.name} ip: ${vm.network_interface.0.access_config.0.nat_ip}"
  ]
}
#output "dev_ip_address" {
# value = google_compute_instance.ncdev[1].network_interface.0.access_config.0.nat_ip
#}

