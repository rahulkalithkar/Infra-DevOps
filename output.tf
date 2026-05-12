output "vpc_id" {
  value       = aws_vpc.main.id
  description = "VPC ID"
}

output "vpc_cidr" {
  value       = aws_vpc.main.cidr_block
  description = "VPC CIDR block"
}

output "public_subnet_id" {
  value       = aws_subnet.public.id
  description = "Public subnet ID"
}

output "private_subnet_id" {
  value       = aws_subnet.private.id
  description = "Private subnet ID"
}

output "security_group_id" {
  value       = aws_security_group.app_sg.id
  description = "ECS task security group ID"
}

output "ecr_repository_url" {
  value       = aws_ecr_repository.repo.repository_url
  description = "ECR repository URL"
}

output "ecr_repository_name" {
  value       = aws_ecr_repository.repo.name
  description = "ECR repository name"
}

output "ecs_cluster_name" {
  value       = aws_ecs_cluster.main.name
  description = "ECS cluster name"
}

output "ecs_cluster_arn" {
  value       = aws_ecs_cluster.main.arn
  description = "ECS cluster ARN"
}

output "ecs_service_name" {
  value       = aws_ecs_service.app.name
  description = "ECS service name"
}

output "ecs_task_definition_arn" {
  value       = aws_ecs_task_definition.app.arn
  description = "ECS task definition ARN"
}

output "cloudwatch_log_group_name" {
  value       = aws_cloudwatch_log_group.ecs_logs.name
  description = "CloudWatch log group name"
}

output "nat_gateway_ip" {
  value       = aws_eip.nat.public_ip
  description = "NAT Gateway public IP address"
}