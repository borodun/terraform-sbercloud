#Prefix
prefix = "kublrbox"

#ECS
flavour = "s6.large.2"
discSize = 20
keyPair = "KeyPair-Borodun"

#VPC
vpcName = "vpc"
vpcCidr = "10.12.0.0/16"

#Subnet
subnetName = "subnet"
subnetCidr = "10.12.12.0/24"
subnetGateway = "10.12.12.1"
primaryDNS = "100.125.13.59"
secondaryDNS = "8.8.8.8"

#NAT
natName = "nat"

#ELB
elbName = "elb"
listenerName = "listener"
backendLBPort = 9999

#SG
sgName = "sg"
