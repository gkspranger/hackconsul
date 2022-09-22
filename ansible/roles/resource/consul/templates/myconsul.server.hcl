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

bootstrap_expect = 3
