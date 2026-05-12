aws_region               = "us-east-2"
app_name                 = "my-app"
environment              = "dev"
vpc_cidr                 = "10.0.0.0/16"
public_subnet_cidr       = "10.0.1.0/24"
private_subnet_cidr      = "10.0.2.0/24"
availability_zones       = ["us-east-2a", "us-east-2b"]
container_port           = 80
task_cpu                 = "256"
task_memory              = "512"
desired_count            = 1

common_tags = {
  Terraform   = "true"
  Environment = "dev"
  Project     = "Infra-DevOps"
  Owner       = "DevOps"
}
