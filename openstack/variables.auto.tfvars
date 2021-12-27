#Prefix
prefix = "openstack"

#ECS
image = "Ubuntu 20.04 server 64bit"
workerNodesCount = 2
workerFlavour = "s6.xlarge.2"
masterFlavour = "s6.xlarge.4"
discSize = 50
keyPair = "KeyPair-Borodun"

#VPC
vpcName = "vpc"
vpcCidr = "10.13.0.0/16"

#Subnet
subnetName = "subnet"
subnetCidr = "10.13.13.0/24"
subnetGateway = "10.13.13.1"
primaryDNS = "100.125.13.59"
secondaryDNS = "8.8.8.8"

#NAT
natName = "nat"

#ELB
elbName = "elb"
listenerName = "listener"

#SG
sgName = "sg"