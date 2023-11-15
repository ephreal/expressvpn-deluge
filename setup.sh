#!/bin/bash

# Set the password for the deluge web interface
if [ $D_PASSWORD ]; then
    D_PASSWORD=$(echo -n "c26ab3bbd8b137f99cd83c2c1c0963bcc1a35cad${D_PASSWORD}" | sha1sum | head -c 40)
    sed -i "s/2ce1a410bcdcc53064129b6d950f2e9fee4edc1e/${D_PASSWORD}/g" /root/.config/deluge/web.conf
fi

# Start the deluge services.
# Runs deluge in the foreground to keep the container up so long as deluge is.
/usr/bin/deluge-web
/usr/bin/deluged -d
