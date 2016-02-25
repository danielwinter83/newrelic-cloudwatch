
To run the container with everything enabled you just have to add your
* New Relic License Key
* AWS Access Key
* AWS Secret Key

And then you can run the container like this:
```
docker run --rm -e NEWRELIC_KEY=aaaaa \
            -e AWS_ACCESS_KEY=bbbbbbbbb \
            -e AWS_SECRET_KEY=cccccccc \
            firstbird/newrelic-cloudwatch
```


You can disable parts of that. Available variables are (all enabled by default) :
* EC2
* EBS
* ELB
* RDS
* SQS
* SNS
* EC
* ECR


For example to disable ECR and EC you can run your container like this:
```
docker run --rm -e NEWRELIC_KEY=aaaaa \
            -e AWS_ACCESS_KEY=bbbbbbbbb \
            -e AWS_SECRET_KEY=cccccccc \
            -e EC=false \
            -e ECR=false \
            firstbird/newrelic-cloudwatch
```
