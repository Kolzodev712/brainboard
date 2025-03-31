provider "aws" {
  region                      = "us-east-1"
  access_key                  = "test"
  secret_key                  = "test"
  skip_credentials_validation = true
  skip_requesting_account_id  = true

  endpoints {
    s3       = "http://localhost:4566"
    ec2      = "http://localhost:4566"
    dynamodb = "http://localhost:4566"
  }
}

# S3 Bucket Resource
resource "aws_s3_bucket" "test_bucket" {
  bucket = var.bucket_name
}

resource "aws_s3_bucket_acl" "test_bucket_acl" {
  bucket = aws_s3_bucket.test_bucket.bucket
  acl    = "private"
}

# EC2 Instance Resource (Dummy for LocalStack testing)
resource "aws_instance" "test_instance" {
  ami                         = "ami-0c55b159cbfafe1f0" # Dummy AMI ID
  instance_type               = "t2.micro"
  associate_public_ip_address = true

  tags = {
    Name = "BrainboardTestInstance"
  }
}
