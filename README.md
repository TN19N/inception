# Install docker

https://docs.docker.com/engine/install/ubuntu/
<br>
https://docs.docker.com/compose/install/other/ --> docker-compose
<br>
https://docs.docker.com/engine/install/linux-postinstall/ --> run docker without sudo

# Configuration (.env)

``` bash
### DOMAIN NAME
DOMAIN_NAME="mannouao.42.fr"

### USER ID 
UID="1000"

### GROUP ID
GID="1000"

### DOCKER GROUP ID
DGID="997"

### MYSQL SETUP
MYSQL_ROOT_PASSWORD="azVW36D4FkErhe"
MYSQL_DATABASE="wordpressdb"
MYSQL_USER="wordpressuser"
MYSQL_PASSWORD="fhrENrl66z55yp"

### WORDPRESS SETUP

# - Admine
WORDPRESS_SITE_TITLE="Youcan't"
WORDPRESS_ADMIN_NAME="mannouao"
WORDPRESS_ADMIN_PASSWORD="V8eZVgJWgBzAEGBt"
WORDPRESS_ADMIN_EMAIL="example@gmail.com"

# - User
WORDPRESS_USER_NAME="Mustapha"
WORDPRESS_USER_EMAIL="example2@gmail.com"
WORDPRESS_USER_PASSWORD="104QAW09tyMd"
WORDPRESS_USER_ROLE="author"

### FTP SETUP
FTP_USER_NAME="Mustapha"
FTP_USER_PASSWORD="SqQ59q417Tdb"
```
<p>Edit the file as you like :)</p>
<p>Note: make sure that your domain name pointing to your localhost in your /etc/hosts !!</p>

# Diagram

<img src="https://github.com/Mustapha-Nawawi-T/inception/blob/main/img/dgr.png?raw=true"/>

# Services

<ul>
  <li>wordpress</li>
  <li>mariadb</li>
  <li>nginx</li>
  <li>adminer</li>
  <li>ftp (vsftpd)</li>
  <li>portainer</li>
  <li>portfolio (html + css + javaScript)</li>
  <li>redis</li>
</ul>
