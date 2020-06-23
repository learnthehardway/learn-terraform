# Declaring Variables
variable "image_name" {
    type = "string"
    default = "nginx:latest"
    description = "Pulling Latest Nginx Image"
}
variable "container_name" {
    type = "string"
    default = "nginx-container"
    description = "Name for Container"
}
variable "int_port" {
    type = "string"
    default = "80"
    description = "Internal Port"
}

variable "ext_port" {
    type = "string"
    default = "80"
    description = "External Port"
}
# Download docker images
resource "docker_image" "image_id" {
    name = "${var.image_name}"
}

# Start the container 

resource docker_container "container_id" {
    name = "${var.container_name}"
    image = "${docker_image.image_id.latest}"
    ports {
        internal = "${var.int_port}"
        external = "${var.ext_port}"
    }
}

# OUTPUT VALUES 

output "Docker_Container_Name" {
    value = "${docker_container.container_id.name}"
    description = "Name Of Container"
}

output "Docker_Container_IP" {
    value = "${docker_container.container_id.ip_address}"
    description = "Docker Container IP"
}

# Printing IMAGE NAME 
output "Docker_Image_Name" {
    value = "${docker_image.image_id.name}"
}


# Executing Terraform
terraform validate
# YOU CAN OVERRIDE VARIABLES WHILE DOING TERRAFORM APPLY USING VAR FLAG
terraform apply -var "container_name=test-container" -var "ext_port=80"
#DESTROY ENVIRONMENT
terraform destroy -var "ext_port=80"