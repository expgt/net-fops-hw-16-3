resource "yandex_vpc_network" "vpc" {
  name = "vpc"
}

resource "yandex_vpc_subnet" "subnet" {
  name           = "subnet"
  zone           = "ru-central1-d"
  network_id     = yandex_vpc_network.vpc.id
  v4_cidr_blocks = ["10.0.1.0/24"]
}


resource "yandex_vpc_security_group" "sg" {
  name        = "sg"
  network_id  = yandex_vpc_network.vpc.id

  ingress {
    protocol       = "ANY"
    description    = "Allow from anywhere"
    v4_cidr_blocks = ["0.0.0.0/0"]
    from_port      = 0
    to_port        = 65535
  }

  egress {
    protocol       = "ANY"
    description    = "Allow all outbound traffic"
    v4_cidr_blocks = ["0.0.0.0/0"]
    from_port      = 0
    to_port        = 65535
  }
}
