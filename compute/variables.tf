variable "ssh_key" {
  type        = string
  description = "Provides custom public ssh key"
}

# Generate a Random Subnet Index 
resource "random_integer" "subnet" {
  min = 0
  max = length(data.aws_subnets.public.ids) - 1
}