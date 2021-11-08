provider "google" {
project = "terraform-287414"
region = "us-central1"
}

data "google_compute_image" "myimage" {
        family = "debian-10"
        project = "debian-cloud"
}
resource "google_compute_instance" "firstvm" {
name = "myvm1"
zone = "us-central1"
machine_type = "f1-micro"
boot_disk {
        initialize_params {
                image = data.google_compute_image.myimage.self_link
}
}
network_interface {
network = "default"
}
}