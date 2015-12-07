#!/bin/bash

# check for root
if [[ $EUID -ne 0 ]]; then
    echo "This script must be run as root" 1>&2
    exit 1
fi

# Applications to be installed
APP_LIST="build-essential git tmux mutt lynx rtorrent weechat mat mc keepassx xclip vim curl mplayer vlc gnupg keepnote audcious gummi"

# Update Apt and upgrade current packages
apt-get update && apt-get upgrade -y

# Install defined APP_LIST packages
apt-get install -y $APP_LIST

echo ""
echo "Your packages have been installed, you may want to reboot."
