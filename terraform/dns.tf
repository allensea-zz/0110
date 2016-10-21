# Route53 zone
resource "aws_route53_zone" "0110" {
    name = "zerooneonezero.co.uk"
}

# A records
resource "aws_route53_record" "origin" {
    zone_id = "${aws_route53_zone.0110.zone_id}"
    name = "zerooneonezero.co.uk"
    type = "A"

    alias {
        name = "${aws_s3_bucket.zerooneonezero_co_uk.website_domain}"
        zone_id = "${aws_s3_bucket.zerooneonezero_co_uk.hosted_zone_id}"
        evaluate_target_health = false
    }
}

resource "aws_route53_record" "origin_www" {
    zone_id = "${aws_route53_zone.0110.zone_id}"
    name = "www.zerooneonezero.co.uk"
    type = "A"

    alias {
        name = "${aws_s3_bucket.www_zerooneonezero_co_uk.website_domain}"
        zone_id = "${aws_s3_bucket.www_zerooneonezero_co_uk.hosted_zone_id}"
        evaluate_target_health = false
    }
}

# MX records
resource "aws_route53_record" "mx" {
    zone_id = "${aws_route53_zone.0110.zone_id}"
    name = "zerooneonezero.co.uk"
    type = "MX"
    ttl = "5"
    records = [
        "10 aspmx.l.google.com",
        "20 alt1.aspmx.l.google.com",
        "20 alt2.aspmx.l.google.com",
        "30 aspmx2.googlemail.com",
        "30 aspmx3.googlemail.com"
    ]
}

# TXT records
resource "aws_route53_record" "txt" {
    zone_id = "${aws_route53_zone.0110.zone_id}"
    name = "zerooneonezero.co.uk"
    type = "TXT"
    ttl = "5"
    records = ["v=spf1 include:_spf.google.com ~all", "google-site-verification=pjHbSOwsVwzE1kE4R6jxxnKbyI3-HygzgBjzPCvsYdI"]
}

# CNAME records
resource "aws_route53_record" "cname_dc" {
    zone_id = "${aws_route53_zone.0110.zone_id}"
    name = "_domainconnect.zerooneonezero.co.uk"
    type = "CNAME"
    ttl = "3600"
    records = ["_domainconnect.gd.domaincontrol.com"]
}
    
