service {
  name = "example"
  id   = "{{ ansible_nodename }}-example"
  port = 80

  tags = ["v{{ [1, 2, 3] | ansible.builtin.random }}"]

  check = {
    name = "HTTP on port 80"
    http = "http://localhost:80/"
    method = "GET"
    interval = "10s"
    timeout = "1s"
  }

  meta = {
    env = "dev"
    role = "web"
  }
}
