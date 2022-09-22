datacenter = "mydc1"

data_dir = "/opt/consul"

log_file = "/var/log/consul/consul.log"
log_level = "debug"
log_rotate_max_files = 1

node_name = "{{ ansible_nodename }}"

enable_syslog = false

enable_script_checks = true

bind_addr = "{{ ansible_eth1.ipv4.address }}" # Listen on all IPv4

retry_join = [
{% for node in consul_server_nodes %}
  "{{ node }}",
{% endfor %}
]

{% if consul_is_server | default(False) %}
{{ lookup("ansible.builtin.template", "roles/resource/consul/templates/myconsul.server.hcl") }}
{% else %}
{{ lookup("ansible.builtin.template", "roles/resource/consul/templates/myconsul.client.hcl") }}
{% endif %}
