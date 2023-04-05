terraform{
    required_providers{
        //Which Cloud Provider are we using?
        //AWS
        aws ={
            source ="hashicorp/aws"
            version ="~> 4.16"
        }
    }
    //required version
    required_version = ">=1.2.0"
}

//Now let's provision resources in a given region

provider "aws"{
region = "us-east-1"

}

//Provision s3 bucket
resource "aws_s3_bucket" "s3_bucket" {
//bucket name should be unique
//This is the bucket name
  bucket = "tcb-app-qa-uo"
}

//Block public access
resource "aws_s3_bucket_public_access_block" "s3_block" {
  //reference for bucket we just created
  bucket = aws_s3_bucket.s3_bucket.id

block_public_acls = true
block_public_policy = true
ignore_public_acls = true
restrict_public_buckets = true
}