FROM gekkie/newrelic-cloudwatch
MAINTAINER daniel <daniel.winter@firstbird.eu>

ADD src/newrelic_plugin.yml /usr/local/newrelic_aws_cloudwatch_plugin-latest/config/newrelic_plugin.yml
ADD src/start.sh /usr/local/start.sh
RUN chmod +x /usr/local/start.sh

ENTRYPOINT ["/usr/local/start.sh"]
CMD ["/usr/local/newrelic_aws_cloudwatch_plugin-latest/bin/newrelic_aws"]
