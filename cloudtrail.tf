

resource "aws_cloudtrail" "foobar" {
  name                          = "tf-trail-foobar"
  s3_bucket_name                = "${aws_s3_bucket.foo.id}"
  s3_key_prefix                 = "prefix"
  include_global_service_events = false
  enable_logging = true
}

resource "aws_s3_bucket" "foo" {
  bucket        = "tf-test-trail"
  force_destroy = true
}

resource "aws_s3_bucket_public_access_block" "foo" {
  bucket = "${aws_s3_bucket.foo.id}"

  block_public_acls   = true
  block_public_policy = true
}