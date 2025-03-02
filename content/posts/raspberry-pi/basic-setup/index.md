---
categories: ["raspberry-pi"]
title: "Raspberry Pi Basic Setup Guide"
date: "2025-03-02"
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

This guide covers the essential steps to set up your Raspberry Pi, configure networking, remote access, and some basic services. This guide has been updated for Raspberry Pi OS based on Debian Bookworm.

## Initial Setup

### 1. Download Raspberry Pi OS

Visit the official Raspberry Pi website to download the latest version of Raspberry Pi OS:
[https://www.raspberrypi.com/software/operating-systems/](https://www.raspberrypi.com/software/operating-systems/)

### 2. Flash the OS to SD Card

You can use the official Raspberry Pi Imager which makes this process simple:
[https://www.raspberrypi.com/software/](https://www.raspberrypi.com/software/)

The Imager tool lets you configure several settings before flashing, including:
- Hostname
- SSH access
- WiFi credentials
- User account information

### 3. Configure Wireless Network

If you didn't configure WiFi using the Raspberry Pi Imager, you can create a `wpa_supplicant.conf` file in the boot partition with:

```
country=US  # Change to your country code
ctrl_interface=DIR=/var/run/wpa_supplicant GROUP=netdev
update_config=1
network={
    ssid="YourNetworkName"
    psk="YourNetworkPassword"
    key_mgmt=WPA-PSK
}
```

### 4. Enable SSH

If you didn't enable SSH using the Raspberry Pi Imager, create an empty file named `ssh` (no extension) in the boot partition.

### 5. First Boot and Configuration

After booting your Raspberry Pi:

```bash
# Update your system
sudo apt update && sudo apt full-upgrade -y

# Run the configuration tool
sudo raspi-config
```

In the configuration tool:
- Expand filesystem to use the full SD card
- Enable VNC if you need a graphical remote desktop
- Set your locale, timezone, and keyboard layout
- Configure any other options as needed

## Setting Up Static IP

Modern Raspberry Pi OS uses `dhcpcd` for network configuration:

```bash
sudo nano /etc/dhcpcd.conf
```

Add the following to configure a static IP for Ethernet and/or WiFi:

```
# Static IP for Ethernet
interface eth0
static ip_address=192.168.1.32/24
static routers=192.168.1.1
static domain_name_servers=192.168.1.1 8.8.8.8

# Static IP for WiFi
interface wlan0
static ip_address=192.168.1.31/24
static routers=192.168.1.1
static domain_name_servers=192.168.1.1 8.8.8.8
```

Restart networking:

```bash
sudo systemctl restart dhcpcd
```

## Remote Access Setup

### SSH Access

SSH should be enabled by default if you created the `ssh` file or used the Raspberry Pi Imager to enable it. Connect with:

```bash
ssh username@192.168.1.31
```

### VNC Server Configuration

Install RealVNC server:

```bash
sudo apt install realvnc-vnc-server
sudo systemctl enable vncserver-x11-serviced
sudo systemctl start vncserver-x11-serviced
```

For headless setups, enable VNC with a virtual display:

```bash
sudo raspi-config
```

Navigate to Interface Options > VNC > Yes, then set up a virtual resolution under Advanced Options > Resolution.

## Remote Access Over the Internet

### Method 1: SSH Tunneling

```bash
ssh -p22 -L5901:localhost:5901 username@your-public-ip
```

Then connect your VNC client to `localhost:5901`.

### Method 2: VPN Server

Setting up a VPN server like WireGuard or OpenVPN provides more secure remote access.

```bash
# Install WireGuard
sudo apt install wireguard
```

For WireGuard configuration, see: [WireGuard Setup Guide](https://www.wireguard.com/quickstart/)

### Method 3: Tailscale

Tailscale provides easy and secure remote access:

```bash
curl -fsSL https://tailscale.com/install.sh | sh
sudo tailscale up
```

## Setting Up Dynamic DNS

If your public IP changes regularly, set up a dynamic DNS service to keep your domain pointing to your current IP.

### Install ddclient

```bash
sudo apt install ddclient
```

Configure for your dynamic DNS provider:

```bash
sudo nano /etc/ddclient.conf
```

Example for Duck DNS:

```
use=web, web=checkip.dyndns.org
protocol=dyndns2
server=www.duckdns.org
login=your-token
password=anything
yourdomain.duckdns.org
```

### Dynamic DNS Script Alternative

For providers without direct ddclient support, create a script:

```python
#!/usr/bin/python3
import requests
import logging
import time
from pathlib import Path

# Setup logging
logging.basicConfig(level=logging.INFO, format='%(asctime)s:%(levelname)s:%(message)s', 
                    filename='/home/pi/dyndns/update.log')

# Configuration
TOKEN = "your-token"
DOMAIN = "your-domain"
PROVIDER_URL = "https://www.example.com/update"
IP_CHECK_URL = "https://api.ipify.org"
LAST_IP_FILE = Path("/home/pi/dyndns/last_ip.txt")

def get_current_ip():
    try:
        return requests.get(IP_CHECK_URL).text.strip()
    except Exception as e:
        logging.error(f"Error getting IP: {e}")
        return None

def update_dns(ip):
    try:
        params = {"domain": DOMAIN, "token": TOKEN, "ip": ip}
        response = requests.get(PROVIDER_URL, params=params)
        if response.status_code == 200:
            logging.info(f"DNS updated successfully to {ip}")
            return True
        else:
            logging.error(f"Failed to update DNS: {response.text}")
            return False
    except Exception as e:
        logging.error(f"Error updating DNS: {e}")
        return False

def main():
    current_ip = get_current_ip()
    if not current_ip:
        return
    
    last_ip = None
    if LAST_IP_FILE.exists():
        last_ip = LAST_IP_FILE.read_text().strip()
    
    if current_ip != last_ip:
        logging.info(f"IP changed from {last_ip} to {current_ip}")
        if update_dns(current_ip):
            LAST_IP_FILE.write_text(current_ip)
    else:
        logging.debug("IP has not changed")

if __name__ == "__main__":
    main()
```

Add to crontab to run every 5 minutes:

```bash
crontab -e
```

```
*/5 * * * * /usr/bin/python3 /home/pi/dyndns/update.py
```

## Web Server Setup

### Apache and PHP

Install Apache and PHP:

```bash
sudo apt install apache2 php libapache2-mod-php -y
sudo apt install php-mysql php-gd php-json php-curl php-mbstring php-xml php-zip -y
sudo systemctl enable apache2
sudo systemctl start apache2
```

### MySQL/MariaDB

```bash
sudo apt install mariadb-server -y
sudo systemctl enable mariadb
sudo systemctl start mariadb
sudo mysql_secure_installation
```

### WordPress Installation

```bash
cd /var/www/html/
sudo rm index.html
sudo wget https://wordpress.org/latest.tar.gz
sudo tar xzf latest.tar.gz
sudo mv wordpress/* .
sudo rm -rf wordpress latest.tar.gz
sudo chown -R www-data:www-data .
```

Create a database for WordPress:

```bash
sudo mysql -u root -p
```

```sql
CREATE DATABASE wordpress;
CREATE USER 'wpuser'@'localhost' IDENTIFIED BY 'your-secure-password';
GRANT ALL PRIVILEGES ON wordpress.* TO 'wpuser'@'localhost';
FLUSH PRIVILEGES;
EXIT;
```

Enable URL rewriting:

```bash
sudo a2enmod rewrite
sudo nano /etc/apache2/sites-available/000-default.conf
```

Add the following inside the `<VirtualHost>` section:

```
<Directory "/var/www/html">
    AllowOverride All
</Directory>
```

Restart Apache:

```bash
sudo systemctl restart apache2
```

## Additional Tips

### Performance Optimization

1. Use a high-quality, fast microSD card (Class 10 or UHS-I at minimum)
2. Consider using a USB SSD for better performance and reliability
3. Adjust swap size:

```bash
sudo nano /etc/dphys-swapfile
# Change CONF_SWAPSIZE to 1024 for 1GB swap
sudo systemctl restart dphys-swapfile
```

### Cooling and Overclocking

For Raspberry Pi 4/5, proper cooling is essential. Consider:

1. A good quality heatsink
2. A cooling fan
3. A proper case with ventilation

For overclocking (with proper cooling):

```bash
sudo nano /boot/firmware/config.txt
```

Add or modify:

```
# Overclock settings (use with caution)
over_voltage=6
arm_freq=2000
```

### Automatic Updates

```bash
sudo apt install unattended-upgrades
sudo dpkg-reconfigure unattended-upgrades
```

### Backup Your SD Card

Regularly backup your SD card using tools like:
1. Raspberry Pi Imager
2. Win32DiskImager
3. dd command on Linux
4. rpi-clone for cloning to another SD card

## Troubleshooting

### Common Issues and Solutions

1. **WiFi Disconnection**: Add `wifi.powersave = 2` to `/etc/NetworkManager/conf.d/default-wifi-powersave-on.conf`

2. **System Freezes**: Check temperature with `vcgencmd measure_temp` - high temperatures may require better cooling

3. **Boot Problems**: Press Shift during boot to access recovery options

4. **Performance Issues**: Monitor with `top` or `htop`. If CPU is constantly at 100%, check for runaway processes

For more help, visit the Raspberry Pi forums: [https://forums.raspberrypi.com/](https://forums.raspberrypi.com/)