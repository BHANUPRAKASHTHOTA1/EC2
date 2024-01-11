#!/bin/bash
NAMES=("mangodb" "cart" "mysql" "shipping" "user" "payment" "rabbitmq" "redis" "catalogue" "web")
INSTANCE_TYPE=""
IMAGE_ID=ami-03265a0778a880afb
SECURITY_GROUP_ID=sg-06ce6a064fac8ab76
#if mysql and mongodb instance_type should be in t3.medium and for all other t2.micro

for i in "${NAMES[@]}"
do
    if[ $i == "mongodb"] || $i == "mysql" ]
    then
        INSTANCE_TYPE="t3.medium"
    else
        INSTANCE_TYPE="t2.micro"
    fi

    echo "Creating $i Instance"
    aws ec2 run-instances --image-id $IMAGE_ID --instance-type $INSTANCE_TYPE --security-group-ids $SECURITY_GROUP_ID --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=$i}]"
done