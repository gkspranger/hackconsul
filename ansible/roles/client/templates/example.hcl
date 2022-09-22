service {
  name = "example"
  id   = "{{ ansible_nodename }}-example"
  port = 10000

  meta = {
    env = "dev"
  }
}
