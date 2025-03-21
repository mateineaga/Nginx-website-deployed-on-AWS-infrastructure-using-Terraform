#!/bin/bash

sudo yum update

sudo amazon-linux-extras install nginx1.12 

sudo systemctl start nginx

sudo systemctl enable nginx


export TOKEN=$(curl -X PUT "http://169.254.169.254/latest/api/token" -H "X-aws-ec2-metadata-token-ttl-seconds: 21600")


export COMPUTE_MACHINE_UUID=$(cat /sys/devices/virtual/dmi/id/product_uuid | tr '[:upper:]' '[:lower:]')


export COMPUTE_INSTANCE_ID=$(curl -H "X-aws-ec2-metadata-token: $TOKEN" -s http://169.254.169.254/latest/meta-data/instance-id)


MESSAGE="This message was generated on instance ${COMPUTE_INSTANCE_ID} with the following UUID ${COMPUTE_MACHINE_UUID}"

echo "$MESSAGE" > /usr/share/nginx/html/index.html

# # Write the message to a text file named after the instance ID
# echo "$MESSAGE" > /tmp/${COMPUTE_INSTANCE_ID}.txt

# # Define the S3 bucket name and folder path
# BUCKET_NAME="epam-tf-lab-8fv70iah"  # Replace with your S3 bucket name
# FOLDER_PATH="test"        # Replace with the folder path if needed (optional)

# # Upload the file to S3 using AWS CLI (Ensure the instance has an IAM role with S3 access)
# aws s3 cp /tmp/${COMPUTE_INSTANCE_ID}.txt s3://$BUCKET_NAME/${COMPUTE_INSTANCE_ID}.txt

# # Clean up the temporary file
# rm /tmp/${COMPUTE_INSTANCE_ID}.txt
