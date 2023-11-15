# Run expressvpn and deluge in a container

FROM polkaned/expressvpn:latest
LABEL maintainer="ephreal@superfake.email"

ENV D_PASSWORD=""

RUN cat /etc/resolv.conf \
    && apt-get update && apt-get install -y \
    deluged \
    deluge-web \
    iptables \
    && rm -rf /var/lib/apt/lists/* \
    && echo "ENABLE_DELUGED=1" > /etc/default/deluged \
    && mkdir -p "/var/lib/deluged/downloads"

COPY deluged_config.conf /root/.config/deluge/core.conf
COPY web.conf /root/.config/deluge/web.conf
COPY setup.sh /root/setup.sh

CMD ["/bin/bash", "/root/setup.sh"]
