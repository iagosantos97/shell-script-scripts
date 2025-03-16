#!/bin/bash

$HOST=

for endpoint in $(cat endpoints-swagger.txt)
do
	echo "$endpoint: $(curl -k -s -o /dev/null -w "%{http_code}" https://$HOST/$endpoint)"
done
