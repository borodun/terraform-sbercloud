#Prefix
prefix = "alt-k8s"

#ECS
image = "Alt Server V 9.2"
workerNodesCount = 2
workerFlavour = "s6.large.2"
masterFlavour = "s6.large.2"
discSize = 50
keyPair = "KeyPair-Borodun"

#VPC
vpcName = "vpc"
vpcCidr = "10.11.0.0/16"

#Subnet
subnetName = "subnet"
subnetCidr = "10.11.11.0/24"
subnetGateway = "10.11.11.1"
primaryDNS = "100.125.13.59"
secondaryDNS = "8.8.8.8"

#NAT
natName = "nat"

#ELB
elbName = "elb"
listenerName = "listener"

#SG
sgName = "sg"
