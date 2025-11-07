📦 Day 8: EC2 Provisioning via AWS CLI
🧠 Goal
Provision an EC2 instance using AWS CLI (not GUI), configure access, and host a simple  to validate CLI-based infrastructure automation.

🔐 IAM Setup (GUI)
• 	Created IAM user with programmatic access
• 	Attached EC2 Full Access policy
• 	Generated Access Key ID and Secret Access Key

🖥️ AWS CLI Setup (Local WSL)

curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
aws --version

aws configure
# Access Key, Secret Key, Region: eu-north-1, Output: json

🧬 AMI Discovery

aws ec2 describe-images \
  --owners 099720109477 \
  --filters "Name=name,Values=ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*" \
  --query "Images[*].[ImageId,CreationDate]" \
  --region eu-north-1 \
  --output json
  
🔑 Key Pair Creation

aws ec2 create-key-pair \
  --key-name day8-key-v2 \
  --query "KeyMaterial" \
  --region eu-north-1 \
  --output text > ~/day8-key-v2.pem

chmod 400 ~/day8-key-v2.pem

🛡️ Security Group Setup
aws ec2 create-security-group \
  --group-name day8-sg \
  --description "Day 8 SG for SSH and HTTP" \
  --region eu-north-1


aws ec2 authorize-security-group-ingress \
  --group-id <your-sg-id> \
  --protocol tcp --port 22 --cidr 0.0.0.0/0 \
  --region eu-north-1

aws ec2 authorize-security-group-ingress \
  --group-id <your-sg-id> \
  --protocol tcp --port 8080 --cidr 0.0.0.0/0 \
  --region eu-north-1



🚀 EC2 Launch
aws ec2 run-instances \
  --image-id <ami-id> \
  --count 1 \
  --instance-type t3.micro \
  --key-name day8-key-v2 \
  --security-group-ids <your-sg-id> \
  --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=Day8Learning}]' \
  --region eu-north-1



🌐 Get Public IP
aws ec2 describe-instances \
  --filters "Name=tag:Name,Values=Day8Learning" \
  --query "Reservations[*].Instances[*].PublicIpAddress" \
  --region eu-north-1 \
  --output text



🔐 SSH Access
ssh -i ~/day8-key-v2.pem ubuntu@<public-ip>



🧪 Hosting index.html
mkdir ~/day8-test
cd ~/day8-test
echo '<h1>Hello, Day 8 World!</h1>' > index.html
python3 -m http.server 8080


Visit in browser:
http://<public-ip>:8080



🧹 Cleanup
aws ec2 terminate-instances \
  --instance-ids i-08b504e9fb7c067e5 \
  --region eu-north-1



🧠 Reflection
This exercise validated that CLI-based provisioning can fully replicate GUI workflows. It reinforced IAM setup, key pair management, security group configuration, and instance lifecycle control — all through reproducible scripts.





