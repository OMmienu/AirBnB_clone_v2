#!/usr/bin/env bash
# An installation and configuration of Nginx

#install nginx
sudo apt-get update -y
sudo apt-get install nginx -y

#creating repositories
sudo mkdir -p /data/web_static/releases/test/
sudo mkdir -p /data/web_static/shared/

#creating an html page(A Dummy One)
echo "<!DOCTYPE html>
<html>
  <head>
  </head>
  <body>
    Holberton School
  </body>
</html>" | sudo tee /data/web_static/releases/test/index.html

#creating a symbolic link
sudo ln -sf /data/web_static/releases/test/ /data/web_static/current

#changing directory
sudo chown -R ubuntu:ubuntu /data/

#setting up the page to be served
sudo sed -i '/server_name _;/a \ \tlocation /hbnb_static {\n\t\talias /data/web_static/current;\n\t}\n' /etc/nginx/sites-available/default

#restart the server
sudo service nginx restart
