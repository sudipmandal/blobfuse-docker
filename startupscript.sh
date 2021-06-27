#!/bin/sh

blobfuse /backup --container-name=$AZURE_CONTAINER_NAME --tmp-path=/mnt/blobfusetmp
chmod -R 777 /backup

set -eo pipefail
[[ "${DEBUG}" == "true" ]] && set -x
for FILE in $(find /etc/entrypoint.d -iname \*.sh | sort)
do
source ${FILE}
done
exec $@
