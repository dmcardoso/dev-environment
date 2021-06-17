## Mongodb compass
wget https://downloads.mongodb.com/compass/mongodb-compass-community_1.20.2_amd64.deb
apt --fix-broken install
apt install libgconf-2-4 -y
dpkg -i mongodb-compass-community_1.20.2_amd64.deb
rm -f mongodb-compass-community_1.20.2_amd64.deb