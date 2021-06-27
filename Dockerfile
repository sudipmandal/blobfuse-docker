FROM owncloud/server:latest

RUN apt-get update && apt-get install --no-install-recommends -yq wget ca-certificates \
 && wget --no-check-certificate https://packages.microsoft.com/config/ubuntu/18.04/packages-microsoft-prod.deb \
 && dpkg -i packages-microsoft-prod.deb \
 && apt-get update && apt-get install -y libcurl3-gnutls blobfuse fuse \
 && cd / \
 && wget --no-check-certificate https://raw.githubusercontent.com/sudipmandal/nextcloud-blobfuse-docker/master/startupscript.sh \
 && apt-get remove -y wget \
 && apt-get clean -y \
 && apt-get autoremove -y \
 && rm -rf /var/lib/apt/lists/* \
 && mkdir /mnt/blobfusetmp \
 && mkdir /backup \
 && chmod +x /startupscript.sh

ENTRYPOINT ["/startupscript.sh"]
CMD ["apache2-foreground"]

