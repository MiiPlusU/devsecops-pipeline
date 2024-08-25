module "terraform_state_bucket" {
  source = "./modules/s3"
  bucket_name = "tf-state-bucket-ish"  # Ensure this name is unique
}
