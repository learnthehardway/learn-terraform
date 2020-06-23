# Creating a variable
foo = bar
# Creating List
AMI = ["amazon", "linux", "windows"]
# Creating Map
ID = {"amazon": "ID1", "Linux": "ID2"}

# Referencing Variable

output "foo_value" {
    value = "${var.foo}"
}

output "ami_linux" {
    value = "${var.AMI[1]}"
}

output "id" {
    value = "${var.ID["Linux"]}"
}

/*
*/

variable "template" {
    type = List
    default = ["value1", "value2", "value3"]
}