#!/bin/bash 
podman run --detach \
   --hostname bastion.rubo.lab.test \
   --env GITLAB_OMNIBUS_CONFIG="external_url 'http://bastion.turbo.lab.test'" \
   --publish 9999:443 --publish 9898:80 --publish 8888:22 \
   --name gitlab \
   --restart always \
   --volume /opt/gitlab/config:/etc/gitlab:Z \
   --volume /opt/gitlab/logs:/var/log/gitlab:Z \
   --volume /opt/gitlab/data:/var/opt/gitlab:Z \
   --shm-size 256m \
   gitlab/gitlab-ce:latest
