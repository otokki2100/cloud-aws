#





cd ~/all/archive/2_code/cloud_pub_aws/compute_ec2/instance/distribution/test/001/0_terraform/

# type

`ap-northeast-1`

```bash
- Amazon Linux2: ami-0ab0bbbd329f565e6
```

`ap-northeast-2`

```bash
- Amazon Linux1: ami-0ab3e16f9c414dee7
- Amazon Linux2: ami-0064e711cbc7a825e
- CentOS 06: ami-02eb8e0986956e8d6
- CentOS 07: ami-045f38c93733dd48d
- Redhat 08: ami-09f31cc5d5eecca1a
- Ubuntu 16: ami-0f9af249e7fa6f61b
- Ubuntu 18: ami-0cd744adeca97abb1
- Window 16: ami-08c77e00ec9263551
- Window 2019: ami-0e9348fd7b135d56e
```

`ap-northeast-3`

```bash
- Amazon Linux2: ami-07420201371095f81
```

`us-east-1`

```bash
- Amazon Linux2: ami-0dc2d3e4c0f9ebd18
```

`sa-east-1`

```bash
- Amazon Linux2: ami-05e809fbeee38dd5e
```

`Instance_type`

```bash
- t3.micro
- t3.medium
- g4dn.xlarge
```

# command

# command-seoul

```bash
terraform apply -auto-approve -var region=ap-northeast-2 -var ami_id=ami-0b827f3319f7447c6 -var type=t3.micro -var icount=1 # Amazon Linux 2
terraform apply -auto-approve -var region=ap-northeast-2 -var ami_id=ami-09e2a570cb404b37e -var type=t3.micro -var icount=1 # CentOS 07
terraform apply -auto-approve -var region=ap-northeast-2 -var ami_id=ami-033a6df12b1633bca -var type=t3.micro -var icount=1 # Rocky 08
terraform apply -auto-approve -var region=ap-northeast-2 -var ami_id=ami-0f9af249e7fa6f61b -var type=t3.micro -var icount=1 # Ubuntu 16
terraform apply -auto-approve -var region=ap-northeast-2 -var ami_id=ami-0cd744adeca97abb1 -var type=t3.micro -var icount=1 # Ubuntu 18
terraform apply -auto-approve -var region=ap-northeast-2 -var ami_id=ami-07d16c043aa8e5153 -var type=t3.micro -var icount=1 # Ubuntu 20
terraform apply -auto-approve -var region=ap-northeast-2 -var ami_id=ami-0e9bfdb247cc8de84 -var type=t3.micro -var icount=1 # Ubuntu 22

terraform apply -auto-approve -var region=ap-northeast-2 -var ami_id=ami-08c77e00ec9263551 -var type=t3.medium -var icount=1 # Window 16
terraform apply -auto-approve -var region=ap-northeast-2 -var ami_id=ami-0e9348fd7b135d56e -var type=t3.medium -var icount=1 # Window 19
terraform apply -auto-approve -var region=ap-northeast-2 -var ami_id=ami-012b9d1d0d2e2c900 -var type=t3.medium -var icount=1 # Window 22
```

# command-tokyo

```bash
terraform apply -auto-approve -var region=ap-northeast-1 -var ami_id=ami-0ab0bbbd329f565e6 -var type=t3.micro -var icount=1 # Amazon Linux 2
```

```bash
EC2_PUBLIC_IP_0=$(terraform output -json | jq -r '.ec2_public_ip.value[0]')
EC2_PUBLIC_IP_1=$(terraform output -json | jq -r '.ec2_public_ip.value[1]')

ssh -i id_rsa ec2-user@$EC2_PUBLIC_IP_0

ssh -i id_rsa centos@$EC2_PUBLIC_IP_0

ssh -i id_rsa rocky@$EC2_PUBLIC_IP_0

ssh -i id_rsa ubuntu@$EC2_PUBLIC_IP_0
```
