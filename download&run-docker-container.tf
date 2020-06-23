# DEPLOY GHOST IMAGE

# Download Image
resource "docker_image" "ghost_image" {
    name = "ghost:latest"
}

# Start Container
resource docker_container ghost_container {
    name = "ghost_container"
    image = "${docker_image.ghost_image.latest}"
    ports {
        internal = "2368"
        external = "80"
    }
} 


# DEPLOY NGINX IMAGE

# Download Image
resource "docker_image" "nginx-latest" {
	
	name = "nginx:latest"
}

# Start Container

resource "docker_container" nginx-container {
	name = "nginx-container"
	image = "${docker_image.nginx-latest.latest}"
	ports {
	   internal = "80"
	   external = "80"
	}
}