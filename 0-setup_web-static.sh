#!/usr/bin/env bash
# sets up the web servers for the deployment of web_static

sudo apt-get -y update
sudo apt-get -y upgrade
sudo apt-get -y install nginxi
sudo mkdir -p /data/web-static/releases/test /data/web-static/shared
echo "This is a test" | sudo tee /data/web-static/releases/test/index.html
sudo ln -sf /data/web-static/releases/test/ /data/web-static/current
sudo chown -hR ubuntu:ubuntu /data/
sudo sed -i '38i\\tlocation /bibr_static/ {\n\t\talias /data/web-static/current/;\n\t}\n' /etc/nginx/sites-available/default
sudo service nginx start
