resource "aws_s3_bucket" "priya-resume-bucket" {
  bucket = "priya-resume-bucket"

  tags = {
    Name = "priya-resume-bucket"
  }
}

resource "aws_s3_object" "object" {

  bucket   = aws_s3_bucket.priya-resume-bucket.id
  key      = each.value
  for_each = fileset("../MyPortfolio/", "**")
  source   = "../MyPortfolio/index.html"
  etag     = filemd5("../MyPortfolio/${each.value}")

}