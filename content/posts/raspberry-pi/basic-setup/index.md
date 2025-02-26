---
categories: ["raspberry-pi"]
title: "RaspuerryPiSetup"
date: "2018-11-02"
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


Get Raspbian from below link: 

https://www.raspberrypi.org/downloads/raspbian/

Extract the Zip and mount the (.img) image to sd card using dd or Win32 Disk Imager Tool

To boot partition make file wpa\_supplicant.conf file with below content:

```
country=IN
ctrl_interface=DIR=/var/run/wpa_supplicant GROUP=netdev
update_config=1
network={
        ssid="D-Link"
        psk="password"
        key_mgmt=WPA-PSK
}
```

make ssh file without any extension in boot partition to enable ssh.

Run command 'sudo raspi-config' and expand file system and enable vncserver

Set static ip address to both eth and wlan interfaces of pi.

```
sudo nano /etc/network/interfaces
```

```
# interfaces(5) file used by ifup(8) and ifdown(8)

# Please note that this file is written to be used with dhcpcd
# For static IP, consult /etc/dhcpcd.conf and 'man dhcpcd.conf'

# Include files from /etc/network/interfaces.d:
source-directory /etc/network/interfaces.d

auto eth0
iface eth0 inet static
        address 192.168.1.32
        netmask 255.255.255.0
        gateway 192.168.1.1

allow-hotplug wlan0
iface wlan0 inet static
        address 192.168.1.31
        netmask 255.255.255.0
        gateway 192.168.1.1
    wpa-conf /etc/wpa_supplicant/wpa_supplicant.conf
```

Connect to your i using ssh by putty or shell command 'ssh pi@192.168.1.31'

Run the following command to create file tightvnc

```
sudo nano /etc/init.d/tightvnc
```

and paste below code to the tightvnc file

```
#!/bin/sh
### BEGIN INIT INFO
# Provides:          tightvncserver
# Required-Start:    $local_fs
# Required-Stop:     $local_fs
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Short-Description: Start/stop tightvncserver
### END INIT INFO

# Set the USER variable to the name of the user to start tightvncserver under
export USER='pi'

eval cd ~$USER

case "$1" in
  start)
    su $USER -c '/usr/bin/tightvncserver :1 -geometry 1024x768'
    echo "Starting TightVNC server for $USER "
    ;;
  stop)
    pkill Xtightvnc
    echo "Tightvncserver stopped"
    ;;
  *)
    echo "Usage: /etc/init.d/tightvnc {start|stop}"
    exit 1
    ;;
esac
exit 0
```

Run below commands to add tightvnc to system auto-start entry

```
sudo chmod 755 /etc/init.d/tightvnc
sudo update-rc.d tightvnc defaults
```

Connect to pi using Real VNC Viewer Client by ip - 192.168.31:1

To connect to pi over internet 

```
ssh -p22 -L5901:localhost:5901 pi@117.204.238.74
```

```
For VNC use ip - localhost:5901
```

For file transfer either use Filezilla or any other ftp client or simply command 'sftp pi@117.204.238.74'

install synaptic, if it fails to launch from menu, type command - 'gksudo synaptic'

install chromium and chromium driver

apt get install xvf and pip install pyvirtualdisplay, selenium and other dependancies

```
sudo apt-get install xvf xvfb
sudo pip install pyvirtualdisplay selenium
```

make a folder ipemail, file 'ipemail.py' and 'last\_ip.txt' update ipemail.py with below content

```
from urllib.request import urlopen
import re
import smtplib
import os
from selenium import webdriver
from time import sleep
import logging
from pyvirtualdisplay import Display

# Setting pyvirtualdisplay to work without visible display
display = Display(visible=0, size=(800, 600))
display.start()

# Logging to file with specified format
logging.basicConfig(level=logging.DEBUG, format='%(asctime)s:%(levelname)s:%(message)s', filename='ipemailLog.log')

# setup our login credentials
from_address = 'milav.dabgar@gmail.com'
to_address = 'milav.dabgar@gmail.com'
subject = 'milavpi IP'
username = 'urMailUserName'
password = 'urMailPassword'

# setup where we will get our IP address
url = 'http://checkip.dyndns.org'
print("Our chosen ip address service is: ", url)

# open the url, and take ip address
request = urlopen(url).read().decode('utf-8')
# we extract the ip only
ourIP = re.findall("\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}", request)
ourIP = str(ourIP)
ourIP = ourIP[2:-2]
print("Our IP address is:", ourIP)


def send_email(our_IP):
    body_text = ourIP + ' is our milavpi IP address'
    msg = '\r\n'.join(['To: %s' % to_address,
                       'From: %s' % from_address,
                       'Subject: %s' % subject,
                       '', body_text])
    # actually send an email
    server = smtplib.SMTP('smtp.gmail.com:587')
    server.starttls()
    server.login(username, password)
    server.sendmail(from_address, to_address, msg)
    server.quit()
    logging.info("Our email has been sent")


def updateCrazyDomains(ourIP):
    usr = "urCDUserName"
    pwd = "urCDPassword"

    driver = webdriver.Chrome('/usr/lib/chromium-browser/chromedriver')
    driver.get('https://www.crazydomains.in/login/domain-name-login/')
    logging.info("Opened cd")
    sleep(1)

    username_box = driver.find_element_by_id('username')
    username_box.send_keys(usr)
    logging.info("Email Id entered")
    sleep(1)

    password_box = driver.find_element_by_id('member_password')
    password_box.send_keys(pwd)
    logging.info("Password entered")
    sleep(1)

    # login_box = driver.find_element_by_xpath("/html/body/div[2]/div[2]/div/div/div/div/form/div[8]/button")
    login_box = driver.find_element_by_xpath('//*[@id="crazy_member_login"]/div[8]/button')
    login_box.click()
    logging.info("Login Successfull")
    sleep(1)

    domains = driver.find_element_by_xpath('//*[@id="top_menu"]/div/div[1]/ul/li[1]/a')
    domains.click()
    logging.info("Clicked Domains")
    sleep(1)

    dnsSettingModify = driver.find_element_by_xpath('//*[@id="dns_records_render"]/div[2]/div/div[6]/span/a')
    dnsSettingModify.click()
    logging.info("Clicked DNS Settings Modify")
    sleep(1)

    ipAddress = driver.find_elements_by_name("ip_address")
    ipAddress[0].clear()
    ipAddress[0].send_keys(ourIP)
    sleep(1)

    ipAddress[1].clear()
    ipAddress[1].send_keys(ourIP)
    sleep(1)

    updateButton = driver.find_element_by_xpath('//*[@id="dns_records_render"]/div[2]/div[5]/input[1]')
    updateButton.click()
    logging.info("Updated IP addresses")
    sleep(1)

    logging.info("Done")
    driver.quit()
    logging.info("Exited Chrome")


try:
    # open last_ip.txt, and extract the content
    with open('/home/milav/ipemail/last_ip.txt', 'rt') as last_ip:
        last_ip = last_ip.read()

    # check if our ip has changed since last_ip
    if last_ip == ourIP:
        logging.info("Our IP adress have not changed")
    else:
        logging.info("We have a new ip address")
        with open('/home/milav/ipemail/last_ip.txt', 'wt') as last_ip:
            last_ip.write(ourIP)
        logging.info("We have written new ip to text file")
        send_email(ourIP)
        updateCrazyDomains(ourIP)
except Exception as e:
    logging.error('Error occurred ' + str(e))
```

make a crontab entry by command 'crontab -e' add line  
'\*/2 \* \* \* \* export DISPLAY=:1; /usr/bin/python3 /home/pi/ipemail/ipemail.py'  
or while using pyvirtualdisplay add (preferred one)  
'\*/2 \* \* \* \* /usr/bin/python3 /home/pi/ipemail/ipemail.py'  

```
sudo apt-get install apache2 -y
sudo apt-get install php -y
cd /var/www/html/
sudo rm index.html
sudo service apache2 restart
sudo apt-get install mysql-server php-mysql -y
sudo service apache2 restart
cd /var/www/html/
sudo rm *
sudo wget http://wordpress.org/latest.tar.gz
sudo tar xzf latest.tar.gz
sudo mv wordpress/* .
sudo rm -rf wordpress latest.tar.gz
sudo chown -R www-data: .
sudo mysql_secure_installation
```

You will be asked Enter current password for root (enter for none): — press Enter.  
Type in Y and press Enter to Set root password?.  
Type in a password at the New password: prompt, and press Enter. Important: remember this root password, as you will need it later to set up WordPress.  
Type in Y to Remove anonymous users.  
Type in Y to Disallow root login remotely.  
Type in Y to Remove test database and access to it.  
Type in Y to Reload privilege tables now.

```
sudo mysql -uroot -p
create database wordpress;
GRANT ALL PRIVILEGES ON wordpress.* TO 'root'@'localhost' IDENTIFIED BY 'YOURPASSWORD';
FLUSH PRIVILEGES;
```

goto http://localhost  
Database Name: wordpress  
User Name: root  
Password:  
Database Host: localhost  
Table Prefix: wp\_

```
sudo a2enmod rewrite
sudo nano /etc/apache2/sites-available/000-default.conf

add the below content to the file 
<VirtualHost *:80>
    <Directory "/var/www/html">
        AllowOverride All
    </Directory>
    ...

sudo service apache2 restart
```
