resource "aws_security_group" "test_sg1" {
  name = "test_sg"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow incoming traffic to FTP.
  ingress {
    from_port   = 21
    to_port     = 21
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow incoming traffic to FTP.
  ingress {
    from_port   = 137
    to_port     = 139
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow incoming traffic to VNC.
  ingress {
    from_port   = 5800
    to_port     = 5800
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow incoming traffic to VNC.
  ingress {
    from_port   = 5900
    to_port     = 5903
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow incoming traffic to Telnet.
  ingress {
    from_port   = 2323
    to_port     = 2323
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow incoming traffic to Telnet.
  ingress {
    from_port   = 23
    to_port     = 23
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow incoming traffic to SMTP.
  ingress {
    from_port   = 25
    to_port     = 25
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow incoming traffic to POP3.
  ingress {
    from_port   = 110
    to_port     = 110
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow incoming traffic to IMAP.
  ingress {
    from_port   = 143
    to_port     = 143
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow incoming traffic to DNS.
  ingress {
    from_port   = 53
    to_port     = 53
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow incoming traffic to TFTP.
  ingress {
    from_port   = 69
    to_port     = 69
    protocol    = "udp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow outgoing traffic to SSH.
  egress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "example" {
  ami             = "ami-b374d5a5"
  instance_type   = "t2.micro"
  key_name        = "${var.key_name}"
  security_groups = ["${aws_security_group.test_sg1.name}"]
}
