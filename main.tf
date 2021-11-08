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
zone = "us-central1-a"
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


resource "google_compute_instance" "secondvm" {
name = "myvm3"
zone = "us-central1-a"
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

output "vm_name" {
        value = google_compute_instance.firstvm.name
}

output "vm_id" {
        value = google_compute_instance.firstvm.instance_id
}