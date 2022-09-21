datacenter = "mydc1"

data_dir = "/opt/consul"

addresses {
  http = "0.0.0.0"
  dns = "0.0.0.0"
}

ui_config {
  enabled = true
}

server = true

performance {
  raft_multiplier = 1
}

bind_addr = "{{ ansible_eth1.ipv4.address }}" # Listen on all IPv4

bootstrap_expect = 3

log_file = "/var/log/consul/consul.log"
log_level = "debug"
log_rotate_max_files = 1

node_name = "{{ ansible_nodename }}"

enable_script_checks = true

enable_syslog = false

retry_join = [
{% for node in consul_peer_nodes %}
  "{{ node }}",
{% endfor %}
]
