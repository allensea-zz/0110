# zerooneonezero.co.uk zone
resource "aws_route53_zone" "0110" {
    name = "zerooneonezero.co.uk"
}

# resource "aws_route53_record" "0110-ns" {
#     zone_id = "${aws_route53_zone.0110.zone_id}"
#     name = "zerooneonezero.co.uk"
#     type = "NS"
#     ttl = "30"
#     records = [
#         "${aws_route53_zone.0110.name_servers_0",
#         "${aws_route53_zone.0110.name_servers_1",
#         "${aws_route53_zone.0110.name_servers_2",
#         "${aws_route53_zone.0110.name_servers_4"
#     ]
# }
