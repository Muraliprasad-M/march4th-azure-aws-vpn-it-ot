
aws_region = "eu-west-2"
env        = "prod"

# OT Configuration
ot_vpc_id = "vpc-xxxxxxxxxxxxxxxxx" # TODO: replace with OT VPC ID
ot_tgw_subnet_ids = [
  "subnet-ot-az1-xxxxxxxxxxxxx", # OT TGW subnet AZ1
  "subnet-ot-az2-xxxxxxxxxxxxx", # OT TGW subnet AZ2
  "subnet-ot-az3-xxxxxxxxxxxxx"  # OT TGW subnet AZ3
]
ot_tgw_id         = "tgw-xxxxxxxxxxxxxxxxx" # TODO: replace with OT TGW ID
ot_cgw_public_ips = ["52.12.34.56"]         # TODO: replace with OT Azure VPN GW public IP

# IT Configuration
it_vpc_id = "vpc-xxxxxxxxxxxxxxxxx" # TODO: replace with IT VPC ID
it_tgw_subnet_ids = [
  "subnet-it-az1-xxxxxxxxxxxxx", # IT TGW subnet AZ1
  "subnet-it-az2-xxxxxxxxxxxxx", # IT TGW subnet AZ2
  "subnet-it-az3-xxxxxxxxxxxxx"  # IT TGW subnet AZ3
]
it_tgw_id         = "tgw-xxxxxxxxxxxxxxxxx" # TODO: replace with IT TGW ID
it_cgw_public_ips = ["203.0.113.10"]        # TODO: replace with IT Azure VPN GW public IP

# Common Configuration
tgw_asn     = 64512
cgw_bgp_asn = 65515

tags = {
  project = "s2s"
}
