datacenter = "mydc1"

data_dir = "/opt/consul"

addresses {
  http = "0.0.0.0"
}

ui_config {
  enabled = true
}

server = true

bind_addr = "{{ ansible_eth1.ipv4.address }}" # Listen on all IPv4

bootstrap = true

log_file = "/var/log/consul/consul.log"

node_name = "{{ ansible_nodename }}"

enable_script_checks = true

enable_syslog = false
