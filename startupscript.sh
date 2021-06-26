#!/bin/bash

blobfuse /var/www/html/data --container-name=$AZURE_CONTAINER_NAME --tmp-path=/mnt/blobfusetmp
sh /entrypoint.sh
