provider "google" {
project = "terraform-287414"
region = "us-central1"
credentials = "/home/dvaradha/codes/keys.json"
}
resource "google_compute_instance" "firstvm" {
name = "myvm"
zone = "us-central1-a"
machine_type = "f1-micro"
boot_disk {
        initialize_params {
                image = "debian-cloud/debian-10"
}
}
network_interface {
network = "default"
}
}