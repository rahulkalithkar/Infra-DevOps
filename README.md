# Infra-DevOps

A learning DevOps/CICD Infrastructure project that deploys containerized applications using AWS ECS Fargate.

## Architecture Overview

This project creates the following AWS resources:

- **VPC** with public and private subnets across multiple availability zones
- **NAT Gateway** to allow private subnet services to access the internet
- **ECS Cluster** for container orchestration
- **ECR Repository** for container image storage
- **ECS Fargate Service** to run containerized applications
- **CloudWatch Logs** for application logging
- **Security Groups** and **IAM Roles** for proper access control

## Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) >= 1.0
- [AWS CLI](https://aws.amazon.com/cli/) configured with appropriate credentials
- AWS Account with appropriate permissions

## Configuration

### Variables

Edit `terraform.tfvars` to customize your deployment:

```hcl
aws_region           = "us-east-2"
app_name             = "my-app"
environment          = "dev"
vpc_cidr             = "10.0.0.0/16"
container_port       = 80
task_cpu             = "256"
task_memory          = "512"
desired_count        = 1
```

### Available Variables

- `aws_region` - AWS region for deployment (default: us-east-2)
- `app_name` - Application name used for resource naming
- `environment` - Environment name (dev, staging, prod, etc.)
- `vpc_cidr` - VPC CIDR block
- `public_subnet_cidr` - Public subnet CIDR block
- `private_subnet_cidr` - Private subnet CIDR block
- `container_port` - Container port to expose
- `task_cpu` - ECS task CPU (256, 512, 1024, 2048, 4096)
- `task_memory` - ECS task memory in MB
- `desired_count` - Number of ECS task replicas

## Usage

### Initialize Terraform

```bash
terraform init
```

### Plan the deployment

```bash
terraform plan
```

### Apply the configuration

```bash
terraform apply
```

### Destroy resources

```bash
terraform destroy
```

## Outputs

After apply, Terraform will output important information:

- `vpc_id` - VPC identifier
- `ecs_cluster_name` - ECS cluster name
- `ecr_repository_url` - ECR repository URL for pushing images
- `cloudwatch_log_group_name` - CloudWatch log group for container logs
- And more...

## Project Structure

```
.
├── main.tf              # ECS task definition and CloudWatch logs
├── provider.tf          # Provider configuration
├── variables.tf         # Variable definitions
├── terraform.tfvars     # Variable values
├── vpc.tf              # VPC, subnets, NAT gateway
├── security.tf         # Security groups and IAM roles
├── ecs.tf              # ECS cluster and service
├── ecr.tf              # ECR repository
├── output.tf           # Output values
└── README.md           # This file
```

## Deploying Your Application

1. Build your Docker image:
   ```bash
   docker build -t my-app .
   ```

2. Get the ECR repository URL from the output:
   ```bash
   terraform output ecr_repository_url
   ```

3. Login to ECR:
   ```bash
   aws ecr get-login-password --region us-east-2 | docker login --username AWS --password-stdin <ECR_URL>
   ```

4. Tag and push your image:
   ```bash
   docker tag my-app:latest <ECR_URL>:latest
   docker push <ECR_URL>:latest
   ```

5. Update the ECS service:
   ```bash
   aws ecs update-service --cluster my-app-cluster --service my-app-service --force-new-deployment
   ```

## Next Steps

To enhance this setup:

1. **Load Balancer** - Add an Application Load Balancer for better traffic distribution
2. **Auto Scaling** - Implement auto-scaling for ECS services
3. **RDS Database** - Add database layer for stateful applications
4. **Monitoring** - Set up CloudWatch alarms and SNS notifications
5. **Secrets Manager** - Use AWS Secrets Manager for sensitive data
6. **CI/CD Pipeline** - Integrate with GitHub Actions or CodePipeline

## Troubleshooting

### ECS Task fails to start
- Check CloudWatch logs: `terraform output cloudwatch_log_group_name`
- Verify security group rules allow egress on port 443 for ECR access
- Ensure task role has ECR permissions

### Cannot pull image from ECR
- Verify NAT Gateway is properly configured
- Check IAM task execution role has ECR permissions
- Verify ECR repository exists and image is pushed

## License

This project is for learning purposes. Use it as a foundation for your infrastructure.

## Author

Shivani - DevOps Learning Project
