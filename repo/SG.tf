resource "aws_network_acl" "main" {
  vpc_id = "abc"

  egress {
    protocol   = "udp"
    rule_no    = 200
    action     = "allow"
    cidr_block = "10.3.0.0/18"
    from_port  = 135
    to_port    = 135
  }

  egress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_block = "0.0.0.0/0"
    rule_no    = 100
    action     = "allow"
  }

  # Allow incoming traffic from FTP.
  egress {
    from_port   = 21
    to_port     = 21
    protocol    = "tcp"
    cidr_block = "0.0.0.0/0"
    rule_no    = 300
    action     = "allow"
  }

  # Allow incoming traffic from FTP.
  egress {
    from_port   = 137
    to_port     = 139
    protocol    = "-1"
    cidr_block = "0.0.0.0/0"
    rule_no    = 400
    action     = "allow"
  }
