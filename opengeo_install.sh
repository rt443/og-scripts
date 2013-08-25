#!/bin/bash
# This script has to be run as su - otherwise all the cat stuff won't work

sudo apt-get --yes update
sudo apt-get upgrade --yes --fix-missing

#Don't think we need to install postgres 9.1 as 9.2 included in opengeo
#sudo apt-get --yes install postgresql postgresql-client postgresql-contrib
#sudo apt-get --yes install postgresql-server-dev-9.1

sudo fuser -v -n tcp 8080
sudo dd if=/dev/zero of=/swapfile bs=1024 count=1048576
sudo mkswap /swapfile
sudo chown root:root /swapfile
sudo chmod 0600 /swapfile

wget -qO- http://apt.opengeo.org/gpg.key | apt-key add -
echo "deb http://apt.opengeo.org/suite/v3/ubuntu lucid main" >> /etc/apt/sources.list
apt-get --yes update
apt-cache search opengeo
apt-get --yes install opengeo-suite

cat > /etc/postgresql/9.2/main/pg_hba.conf <<EOF
# TYPE  DATABASE        USER            ADDRESS                 METHOD
local   all             all                                     trust
host    all             all             127.0.0.1/32            md5
host    all             all             0.0.0.0/0               md5
host    all             all             ::1/128                 md5
EOF

cat >> /etc/postgresql/9.2/main/postgresql.conf <<EOF
listen_addresses = '*'
EOF

psql -U postgres -c "ALTER USER postgres WITH PASSWORD 'D4nnyd4t4';"

sudo reboot

#psql -U postgres -d geoserver -f fields_900913.sql


