output "droplet_ip" {
  description = "IPs of the created droplets:"
  value = "www-1: ${resource.digitalocean_droplet.www-1.ipv4_address}\nwww-2: ${resource.digitalocean_droplet.www-2.ipv4_address}"
}
