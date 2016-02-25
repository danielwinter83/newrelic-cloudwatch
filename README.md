
To run the container with everything enabled you just have to add your
* New Relic License Key
* AWS Access Key
* AWS Secret Key

And then you can run the container like this:
'''
docker run --rm -e NEWRELIC_KEY=aaaaa \
            -e AWS_ACCESS_KEY=bbbbbbbbb \
            -e AWS_SECRET_KEY=cccccccc \
            firstbird/newrelic-cloudwatch
'''


You can disable parts of that. Available switches (all enabled by default) :
* EC2
* EBS
* ELB
* RDS
* SQS
* SNS
* EC
* ECR


You can run the container like this to disable ECR and EC:
'''
docker run --rm -e NEWRELIC_KEY=aaaaa \
            -e AWS_ACCESS_KEY=bbbbbbbbb \
            -e AWS_SECRET_KEY=cccccccc \
            -e EC=false \
            -e ECR=false \
            firstbird/newrelic-cloudwatch
'''
