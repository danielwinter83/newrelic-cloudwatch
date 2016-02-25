#!/bin/bash
EC2_ENABLED=${EC2:-"true"}
EBS_ENABLED=${EBS:-"true"}
ELB_ENABLED=${ELB:-"true"}
RDS_ENABLED=${RDS:-"true"}
SQS_ENABLED=${SQS:-"true"}
SNS_ENABLED=${SNS:-"true"}
EC_ENABLED=${EC:-"true"}
ECR_ENABLED=${ECR:-"true"}


if [ -z "$NEWRELIC_KEY" ]; then
	echo "NEWRELIC_KEY not detected, did you forget to set it with -e NEWRELIC_KEY=yourkey?"
	exit 1
fi

if [ -z "$AWS_ACCESS_KEY" ]; then
	echo "AWS_ACCESS_KEY not detected, did you forget to set it with -e AWS_ACCESS_KEY=yourkey?"
	exit 1
fi

if [ -z "$AWS_SECRET_KEY" ]; then
	echo "AWS_SECRET_KEY not detected, did you forget to set AWS_SECRET_KEY=yoursecret?"
	exit 1
fi


echo "Replacing keys"
sed -e "s/YOUR_LICENSE_KEY_HERE/$NEWRELIC_KEY/g" -i /usr/local/newrelic_aws_cloudwatch_plugin-latest/config//newrelic_plugin.yml && \
sed -e "s/YOUR_AWS_ACCESS_KEY_HERE/$AWS_ACCESS_KEY/g" -i /usr/local/newrelic_aws_cloudwatch_plugin-latest/config//newrelic_plugin.yml && \
sed -e "s/YOUR_AWS_SECRET_KEY_HERE/$AWS_SECRET_KEY/g" -i /usr/local/newrelic_aws_cloudwatch_plugin-latest/config//newrelic_plugin.yml && \

echo "Replacing settings"
sed -e "s/EC2_ENABLED/$EC2_ENABLED/g" -i /usr/local/newrelic_aws_cloudwatch_plugin-latest/config//newrelic_plugin.yml && \
sed -e "s/EBS_ENABLED/$EBS_ENABLED/g" -i /usr/local/newrelic_aws_cloudwatch_plugin-latest/config//newrelic_plugin.yml && \
sed -e "s/ELB_ENABLED/$ELB_ENABLED/g" -i /usr/local/newrelic_aws_cloudwatch_plugin-latest/config//newrelic_plugin.yml && \
sed -e "s/RDS_ENABLED/$RDS_ENABLED/g" -i /usr/local/newrelic_aws_cloudwatch_plugin-latest/config//newrelic_plugin.yml && \
sed -e "s/SQS_ENABLED/$SQS_ENABLED/g" -i /usr/local/newrelic_aws_cloudwatch_plugin-latest/config//newrelic_plugin.yml && \
sed -e "s/SNS_ENABLED/$SNS_ENABLED/g" -i /usr/local/newrelic_aws_cloudwatch_plugin-latest/config//newrelic_plugin.yml && \
sed -e "s/EC_ENABLED/$EC_ENABLED/g" -i /usr/local/newrelic_aws_cloudwatch_plugin-latest/config//newrelic_plugin.yml && \
sed -e "s/EBS_ENABLED/$EC_ENABLED/g" -i /usr/local/newrelic_aws_cloudwatch_plugin-latest/config//newrelic_plugin.yml && \
sed -e "s/ECR_ENABLED/$ECR_ENABLED/g" -i /usr/local/newrelic_aws_cloudwatch_plugin-latest/config//newrelic_plugin.yml && \

echo "Starting new relic aws plugin agent..."
exec "$@"
