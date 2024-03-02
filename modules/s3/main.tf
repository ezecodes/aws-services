resource "aws_s3_bucket" "s3_bucket" {
  bucket        = var.s3_bucket_name
  force_destroy = true

  tags = {
    Name = "${var.project_name}_s3_bucket"
  }
}