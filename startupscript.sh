#!/bin/bash

blobfuse /backup --container-name=$AZURE_CONTAINER_NAME --tmp-path=/mnt/blobfusetmp
sh /entrypoint.sh
