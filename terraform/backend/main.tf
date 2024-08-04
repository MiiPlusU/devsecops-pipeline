terraform {
  backend "s3" {
    bucket         = "devsecops-pipeline-state-bucket"  # Your chosen bucket name
    key            = "terraform/state"                 # Path within the bucket
    region         = "us-east-2"
    dynamodb_table = "terraform-locks"                  # DynamoDB table for state locking
    encrypt        = true
  }
}
