resource "aws_s3_bucket" "s3_bucket" {
    bucket = "rocketseat-bucket-iac-roberto-two"

    tags = {
        Name = "Primeiro Bucket"
        Iac = true
        context = "${terraform.workspace}"
    }
}