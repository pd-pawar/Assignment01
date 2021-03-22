
# Prerequisites setup and commands to be done on workstation #

# Install docker

# Run Amazon CLI
- docker run -it --rm -v ${​​​​​​PWD}​​​​​​:/work -w /work --entrypoint /bin/sh amazon/aws-cli:2.0.43 

# Tools required for terraform unzip
- yum install -y gzip tar unzip wget

# Use following commands to configure your aws cli with your account with a root user creds
- aws configure 

# Terraform State storage and state lock management

## S3 bucket created with name terraform-demo-eks
- aws s3api create-bucket --bucket terraform-demo-eks --region us-east-1

## dynamodb table created with Primary key as "LockID"  Amazon CLI container setup to execute terraform
- aws dynamodb create-table --table-name terraformstate --attribute-definitions AttributeName=LockID,AttributeType=S --key-schema AttributeName=LockID,KeyType=HASH --provisioned-throughput ReadCapacityUnits=5,WriteCapacityUnits=5

# Terraform CLI setup
- curl -o /tmp/terraform.zip -LO https://releases.hashicorp.com/terraform/0.14.7/terraform_0.14.7_linux_amd64.zip
- unzip /tmp/terraform.zip
- chmod +x terraform && mv terraform /usr/local/bin/
- terraform  


# Copy the extracted folder from zip to present working directory under work folder 
- cd <into code directory under users work folder> 

# Create infrastructure on aws
- terraform init
- terraform plan
- terraform apply 

# EKS config setup to validate our EKS cluster setup 
- aws eks update-kubeconfig --name getting-started-eks --region us-east-2 

# Get kubectl z
- curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl
- chmod +x ./kubectl
- mv ./kubectl /usr/local/bin/kubectl 

# Create Kimai user account creds
- kubectl get pods
- kubectl exec -it <kimai-pod-name> /opt/kimai/bin/console kimai:create-user admin admin@example.com ROLE_SUPER_ADMIN password

# validating created resource in k8s
- kubectl get nodes
- kubectl get deploy
- kubectl get pods
- kubectl get svc 

# Clean up
- terraform destroy 

# To access webserver use load balancer dns name with port 8001