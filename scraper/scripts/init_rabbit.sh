#!/bin/sh

# Create Rabbitmq user
(  rabbitmqctl wait --timeout 60 /var/lib/rabbitmq/mnesia/rabbitmq ; \
rabbitmqctl add_user myuser mypassword 2>/dev/null ; \
rabbitmqctl add_vhost  myvhost 2>/dev/null ; \
rabbitmqctl set_user_tags myuser administrator ; \
rabbitmqctl set_permissions -p myvhost myuser  ".*" ".*" ".*" ; \
echo "*** User 'myuser' with password 'mypassword' completed. ***" ; \
echo "*** Log in the WebUI at port 5672 (example: http:/localhost:5672) ***") &

# $@ is used to pass arguments to the rabbitmq-server command.
# For example if you use it like this: docker run -d rabbitmq arg1 arg2,
# it will be as you run in the container rabbitmq-server arg1 arg2
rabbitmq-server $@