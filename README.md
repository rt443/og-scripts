OpenGeo Suite Setup
===================

    sudo apt-get --yes update
    sudo apt-get --yes install git
    
    cd ~
    git clone https://github.com/rt443/og-scripts.git
    cd og-scripts
    chmod +x *sh
    sudo su
    
    ./opengeo_install.sh

Worth using tmux to multiplex terminal when installing from scratch as the downloads take a long long time

