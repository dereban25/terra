variable "security_group_name" {
  default = "test CodeCommit"
}
variable "rulescoord" {
  type = "list"
  default = [
    { descr = "Coordinates 1"
    range = "175.45.35.160/29" },
    { descr = "Coordinates 2"
    range = "203.198.176.136/29" },
    { descr = "Coordinates 2"
    range = "185.143.147.12/32" },
    { descr = "test_ip"
      range = "31.23.45.32/32" },
    { descr = "test_ip2"
      range = "31.23.47.32/32" },
    { descr = "add_after_state_S3"
      range = "41.23.47.32/32" },
    { descr = "add_2_after_state_S3"
      range = "42.23.47.32/32" },
    { descr = "add_3_after_state_S3"
      range = "42.2.47.32/32" },
  ]
}