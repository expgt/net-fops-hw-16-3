resource "local_file" "inventory" {
  filename = "/home/linu/netfops/net-fops-hw-16-3/playbook/inventory/prod.ini"
  content  = <<-XYZ

  [clickhouse]
  clickhouse1 ansible_host=${yandex_compute_instance.clickhouse.network_interface[0].nat_ip_address}

  [vector]
  vector1 ansible_host=${yandex_compute_instance.vector.network_interface[0].nat_ip_address}

  [lighthouse]
  lighthouse1 ansible_host=${yandex_compute_instance.lighthouse.network_interface[0].nat_ip_address}
  
  XYZ 
}
