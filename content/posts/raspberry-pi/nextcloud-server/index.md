---
categories: ["raspberry-pi"]
title: "NextCloud with Raspuerry Pi"
date: "2019-06-07"
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


This one is about setting up your own Cloud Storage like Google Drive (But Unlimited Storage) at your home on Raspberry Pi. With NextCloud you can Stream Music, Videos. Auto backup Photos to Your Cloud and many more possible apps available in AppStore. For more details google term 'NextCloud'. Enjoy...

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
```

```
nano /etc/apt/sources.list.d/10-buster.list
```

```
deb http://mirrordirector.raspbian.org/raspbian/ buster main contrib non-free rpi
```

```
nano /etc/apt/preferences.d/10-buster
```

```
Package: *
 Pin: release n=stretch
 Pin-Priority: 900

Package: *
 Pin: release n=buster
 Pin-Priority: 750
```

```
apt update
apt install -y -t buster php7.3-fpm php7.3-curl php7.3-gd php7.3-intl php7.3-mbstring php7.3-mysql php7.3-imap php7.3-opcache php7.3-sqlite3 php7.3-xml php7.3-xmlrpc php7.3-zip php7.3-bcmath php-apcu
apt install -y libapache2-mod-php7.3
php -v
```

```
nano /etc/php/7.3/fpm/conf.d/90-pi-custom.ini
```

```
cgi.fix_pathinfo=0

upload_max_filesize=64m
post_max_size=64m
max_execution_time=600
```

```
service php7.3-fpm reload
a2enmod proxy_fcgi setenvif
a2enconf php7.3-fpm
systemctl reload apache2
a2dismod php7.0
a2enmod php7.3
service apache2 restart
```

```
wget https://download.nextcloud.org/community/nextcloud-10.1.1.tar.bz2
tar -xvf nextcloud-10.1.1.tar.bz2
chown -R www-data:www-data nextcloud
mv nextcloud /var/www/html/
```

```
nano /etc/apache2/sites-available/nextcloud.conf
```

```
Alias /nextcloud "/var/www/html/nextcloud/"

<Directory /var/www/html/nextcloud/>
 Options +FollowSymlinks
 AllowOverride All

<IfModule mod_dav.c>
 Dav off
 </IfModule>

SetEnv HOME /var/www/html/nextcloud
SetEnv HTTP_HOME /var/www/html/nextcloud

</Directory>
```

```
ln -s /etc/apache2/sites-available/nextcloud.conf /etc/apache2/sites-enabled/nextcloud.conf
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
MariaDB [(none)]> create database nextcloud;
 Query OK, 1 row affected (0.00 sec)

MariaDB [(none)]> create user nextcloud@localhost identified by '12345';
 Query OK, 0 rows affected (0.00 sec)

MariaDB [(none)]> grant all privileges on nextcloud.* to nextcloud@localhost identified by '12345';
 Query OK, 0 rows affected (0.00 sec)

MariaDB [(none)]> flush privileges;
 Query OK, 0 rows affected (0.00 sec)

MariaDB [(none)]> exit;
 Bye
```

```
apt-get install ntfs-3g -y
mkdir /media/nextclouddrive
groupadd www-data
usermod -a -G www-data www-data
chown -R www-data:www-data /media/nextclouddrive
chmod -R 775 /media/nextclouddrive
id -g www-data
id -u www-data
ls -l /dev/disk/by-uuid
```

```
nano /etc/fstab
```

```
# Mount HDD for user www-data
UUID=522081D770D3CC72 /media/nextclouddrive auto nofail,uid=33,gid=33,umask=0027,dmask=0027,noatime 0 0
# Mount HDD for user pi
UUID=522081D770D3CC72 /media/nextclouddrive auto nofail,uid=1000,gid=1000,umask=0027,dmask=0027,noatime 0 0
```

```
sudo reboot
sudo ls /media/nextclouddrive
```

```
www.planetmilav.com/nextcloud
Username: nextcloud
Password: 12345
Database: nextcloud
Server: localhost
```

```
sudo nano /var/www/html/nextcloud/config/config.php
```

```
0 => 'www.planetmilav.com',
1 => 'planetmilav.com',
2 => '192.168.1.31'
```

```
rsync -avz --progress /home/milav/Downloads/test.txt pi@192.168.1.31:/media/nextclouddrive/milav.dabgar/files/
sudo -u www-data php /var/www/html/nextcloud/occ files:scan --all
```

In case you face - "Exception during scan: "files" is locked", Do Below procedure

```
sudo -u www-data php /var/www/html/nextcloud/occ files:cleanup
sudo -u www-data php /var/www/html/nextcloud/occ maintenance:mode --on
sudo su
mysql -u root -p'seagate' -D nextcloud -e 'delete from oc_file_locks where 1'
exit
sudo -u www-data php /var/www/html/nextcloud/occ maintenance:mode --off
```
