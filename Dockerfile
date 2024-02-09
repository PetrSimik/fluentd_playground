FROM fluentd:latest

USER root

# Install required plugins for Fluentd
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
       build-essential \
       ruby-dev \
    && gem install fluent-plugin-kafka  \
    && gem install fluent-plugin-rabbitmq  \
    && gem sources --clear-all \ 
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /tmp/* /var/tmp/* /usr/lib/ruby/gems/*/cache/*.gem

# Copy Fluentd configuration file
COPY fluent.conf /fluentd/etc/

# Expose the port for Fluentd
EXPOSE 24224

CMD exec fluentd -c /fluentd/etc/$FLUENTD_CONF -p /fluentd/plugins $FLUENTD_OPT
