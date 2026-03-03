
# OT & IT – AWS TGW + AWS S2S VPN to Azure (Terraform + Azure DevOps)

This repo creates **two VPN connections** - one for **OT** and one for **IT**. Each uses its own existing TGW, VPC, and 3 AZ subnets.

- Terraform **1.14.5**, AWS provider **6.32.1**
- Backend (provided by DevOps variable group `aws-prod`):
  - S3 bucket `ot-core-prod-euw2-tfstate`
  - DynamoDB `ot-core-prod-euw2-tfstate-lock`
  - Key: `networking/ot-it-prod/tgw-vpn.tfstate`

## Structure
```
infra/
  modules/tgw-vpn/*.tf
  terraform.tfvars (both OT and IT config)
  *.tf (root creates both VPNs)
azure-pipelines.yml
```

## Running locally
```bash
cd infra
terraform init \
  -backend-config="bucket=ot-core-prod-euw2-tfstate" \
  -backend-config="key=networking/ot-it-prod/tgw-vpn.tfstate" \
  -backend-config="region=eu-west-2" \
  -backend-config="dynamodb_table=ot-core-prod-euw2-tfstate-lock"
terraform plan
terraform apply
```

## Notes
- Both **OT and IT TGWs** must already exist - provide their IDs in `terraform.tfvars`
- **IMPORTANT**: Disable ECMP on existing TGWs to prevent load balancing across VPN tunnels:
  ```bash
  aws ec2 modify-transit-gateway --transit-gateway-id tgw-0197ed40c5a15e3dd --options VpnEcmpSupport=disable --region eu-west-2  # IT TGW
  aws ec2 modify-transit-gateway --transit-gateway-id tgw-046432679404c0c8e --options VpnEcmpSupport=disable --region eu-west-2  # OT TGW
  ```
- Each domain uses its own VPC with 3 TGW attachment subnets (one per AZ)
- Each domain can use **single-IP** or **active-active** Azure gateways by setting one or two IPs in `*_cgw_public_ips`
- If you set `vpn_tunnel_psk`, mirror it in Azure. Otherwise, AWS generates PSKs; read them from outputs after apply
- Replace placeholder VPC/subnet/TGW IDs and Azure public IPs in `terraform.tfvars` before running
