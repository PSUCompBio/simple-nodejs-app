# simple-nodejs-app

a simple node js app

# Instruction on Lambda use.

1. create ec2 instance. Use the bash script which runs the Dockerfile,
2. load the dockerfile and check the image
3. once image is built push the docker to elastic container registry (ECR)
   2a. login to AWS
4. Update lambda ?

### from ec2 instance used to build docker image

- After the inital start up, you might want to check the startup logs to check for errors: vi /var/log/cloud-init-output.log
- Login to aws: aws configure
- Login to ecr: sudo $(aws ecr get-login --region us-east-1 --no-include-email)
- Tag docker image: sudo docker tag <ImageID> <AwsAccountID>.dkr.ecr.us-east-1.amazonaws.com/nodetest
- Push docker to ecr: sudo docker push <AWS-Account-ID>.dkr.ecr.us-east-1.amazonaws.com/
- Update lambda function with latest docker image