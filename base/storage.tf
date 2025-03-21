resource "aws_s3_bucket" "s3_bucket" {
  bucket = "epam-tf-lab-${random_string.my_numbers.result}"

  tags = merge(local.tags)
}

resource "aws_s3_bucket_public_access_block" "s3_block" {
  bucket                  = aws_s3_bucket.s3_bucket.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}


resource "aws_s3_bucket_policy" "allow_access_lb" {
  bucket = aws_s3_bucket.s3_bucket.id
  policy = templatefile("${path.module}/files/s3-policy.tftpl", { rand = random_string.my_numbers.result })
}