# S3 with redirect for static website
resource "aws_s3_bucket" "www_zerooneonezero_co_uk" {
    bucket = "www.zerooneonezero.co.uk"
    acl = "public-read"

    website {
        redirect_all_requests_to = "http://zerooneonezero.co.uk"
    }
}

# S3 for static website
resource "aws_s3_bucket" "zerooneonezero_co_uk" {
    bucket = "zerooneonezero.co.uk"
    acl = "public-read"

    website {
      index_document = "index.html"
      error_document = "error.html"
    }  
}

# Index page
resource "aws_s3_bucket_object" "index" {
    bucket = "${aws_s3_bucket.zerooneonezero_co_uk.id}"
    key = "index.html"
    source = "files/zerooneonezero.co.uk/index.html"
    etag = "${md5(file("files/zerooneonezero.co.uk/index.html"))}"
    content_type = "text/html"
}
