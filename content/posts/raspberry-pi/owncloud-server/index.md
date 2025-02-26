---
categories: ["raspberry-pi"]
title: "OwnCloud with Raspuerry Pi"
date: "2019-04-30"
ShowReadingTime: true
ShowWordCount: true
hidemeta: false
hideSummary: false
ShowBreadCrumbs: false
ShowPostNavLinks: true
ShowCodeCopyButtons: true
ShowShareButtons: false
disableShare: true
searchHidden: false
UseHugoToc: true
comments: true
---


```
sudo su
apt update && apt upgrade
apt install apache2 -y
systemctl start apache2
systemctl enable apache2
apt install -y apache2 mariadb-server libapache2-mod-php7.0 \
    php7.0-gd php7.0-json php7.0-mysql php7.0-curl \
    php7.0-intl php7.0-mcrypt php-imagick \
    php7.0-zip php7.0-xml php7.0-mbstring
wget https://download.owncloud.org/community/owncloud-10.1.1.tar.bz2
tar -xvf owncloud-10.1.1.tar.bz2
chown -R www-data:www-data owncloud
mv owncloud /var/www/html/
```

```
nano /etc/apache2/sites-available/owncloud.conf
```

```
Alias /owncloud "/var/www/html/owncloud/"

<Directory /var/www/html/owncloud/>
 Options +FollowSymlinks
 AllowOverride All

<IfModule mod_dav.c>
 Dav off
 </IfModule>

SetEnv HOME /var/www/html/owncloud
SetEnv HTTP_HOME /var/www/html/owncloud

</Directory>
```

```
ln -s /etc/apache2/sites-available/owncloud.conf /etc/apache2/sites-enabled/owncloud.conf
a2enmod headers
systemctl restart apache2
a2enmod env
a2enmod dir
a2enmod mime
```

```
mysql -u root -p
```

```
MariaDB [(none)]> create database owncloud;
 Query OK, 1 row affected (0.00 sec)

MariaDB [(none)]> create user owncloud@localhost identified by '12345';
 Query OK, 0 rows affected (0.00 sec)

MariaDB [(none)]> grant all privileges on owncloud.* to owncloud@localhost identified by '12345';
 Query OK, 0 rows affected (0.00 sec)

MariaDB [(none)]> flush privileges;
 Query OK, 0 rows affected (0.00 sec)

MariaDB [(none)]> exit;
 Bye
```

```
apt-get install ntfs-3g -y
mkdir /media/ownclouddrive
groupadd www-data
usermod -a -G www-data www-data
chown -R www-data:www-data /media/ownclouddrive
chmod -R 775 /media/ownclouddrive
id -g www-data
id -u www-data
ls -l /dev/disk/by-uuid

sudo reboot
sudo ls /media/ownclouddrive

```

```
nano /etc/fstab
```

```
# Mount HDD for user www-data
UUID=522081D770D3CC72 /media/ownclouddrive auto nofail,uid=33,gid=33,umask=0027,dmask=0027,noatime 0 0
# Mount HDD for user pi
UUID=522081D770D3CC72 /media/ownclouddrive auto nofail,uid=1000,gid=1000,umask=0027,dmask=0027,noatime 0 0
```

```
www.planetmilav.com/owncloud
Username: owncloud
Password: 12345
Database: owncloud
Server: localhost
```

```
sudo nano /var/www/html/owncloud/config/config.php
0 => 'www.planetmilav.com',
1 => 'planetmilav.com',
2 => '192.168.1.31'
```

```
rsync -avz --progress /home/milav/Downloads/test.txt pi@192.168.1.31:/media/ownclouddrive/milav.dabgar/files/
sudo -u www-data php /var/www/html/owncloud/occ files:scan --all
```
