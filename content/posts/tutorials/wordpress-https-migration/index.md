---
categories: ["tutorials"]
title: "Move WordPress from HTTP to HTTPS"
date: "2019-06-18"
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


This post explains how to properly move WordPress from HTTP to HTTPs. We are using certbot cloudflare wildcard to get ssl certificates.Before going through this post we assume that youve already hosted your wordpress site using LAMP server on Raspberry PI. If not do visit this link to do the same.  
[https://planetmilav.com/raspberrypisetup/](https://planetmilav.com/raspberrypisetup/)

Get certbot - an agent to install letsencrypt certificates- for apache using below commands

```
sudo apt-get install certbot python-certbot-apache -t stretch-backports
```

Do execute following commands to install SSL Certificate to each site individually

```
sudo certbot --apache or sudo certbot certonly --apache 
```

If you wish to install Wildcard certificate from Let’s Encrypt to all your CloudFlare DNS, proceed with following procedure

```
sudo pip install certbot-dns-cloudflare
sudo nano /etc/letsencrypt/cloudflareapi.cfg
```

make cloudflareapi.cfg and add your cloudfare account email ID and your API Key.

```
sudo nano cloudflareapi.cfg
```

```
dns_cloudflare_email = 'yourCloudfareAccountEmailID'
dns_cloudflare_api_key = 'youCloudfareAPIKey'
```

Change file mode to limit rights to only creator aka root.

```
sudo chmod 600 /etc/letsencrypt/cloudflareapi.cfg
```

Follow below command to get SSL wildcard certificates to your domain (e.g. planetmilav.com) and all of your Sub Domains (\*.planetmilav.com)

```
 sudo /usr/local/bin/certbot certonly --dns-cloudflare --dns-cloudflare-credentials /etc/letsencrypt/cloudflareapi.cfg -d planetmilav.com,*.planetmilav.com --preferred-challenges dns-01
```

Add cron entry as a root user to Run certbot renew commnd to periodically auto renew your SSL Certificates

```
sudo crontab -e
```

```
14 5 * * * /usr/local/bin/certbot renew --quiet --post-hook "/usr/sbin/service apache2 reload" > /dev/null 2>&1
```

If your HTTP wordpress site is your default site, that is in /var/www/html directory, then edit default-ssl.conf file with below content to configure your default SSL Site.

```
sudo nano /etc/apache2/sites-available/default-ssl.conf
```

```
<IfModule mod_ssl.c>
        <VirtualHost _default_:443>
                ServerAdmin webmaster@localhost

                DocumentRoot /var/www/html

                ErrorLog ${APACHE_LOG_DIR}/error.log
                CustomLog ${APACHE_LOG_DIR}/access.log combined

                SSLEngine on

                SSLCertificateFile /etc/letsencrypt/live/planetmilav.com/fullchain.pem
                SSLCertificateKeyFile /etc/letsencrypt/live/planetmilav.com/privkey.pem
                Include /etc/letsencrypt/options-ssl-apache.conf

        </VirtualHost>
</IfModule>
```

Enable this default-ssl site and restart apache2 service to make changes visible.

```
sudo a2ensite default-ssl.conf
sudo service apache2 restart
```

Update URLs in Home and Site URL to 'https' in Setting -> General Settings Page, if Site stops loading than try below sql commands to recover your site.

```
mysql -u root -p
use wordpress;
show tables;
update wp_options set option_value = 'https://planetmilav.com' where option_id = 1;
select * from wp_options where option_value = 'https://planetmilav.com';
```

Add Below lines to /www/var/html/wp-config.php file

```
/* SSL Settings */
define('FORCE_SSL_ADMIN', true);

/* Turn HTTPS 'on' if HTTP_X_FORWARDED_PROTO matches 'https' */
/*if ($_SERVER['HTTP_X_FORWARDED_PROTO'] == 'https') $_SERVER['HTTPS']='on';*/
if (strpos($_SERVER['HTTP_X_FORWARDED_PROTO'], 'https') !== false) {
    $_SERVER['HTTPS'] = 'on';
}
```

above the lines

```
/** Sets up WordPress vars and included files. */
require_once(ABSPATH . 'wp-settings.php');
```

Finally Use plugin 'Search and Replace' to replace database entries to new https links.

That's all that you need to do to Move WordPress from HTTP to HTTPS.

For more details, visit - 
[https://www.digitalocean.com/community/tutorials/how-to-retrieve-let-s-encrypt-ssl-wildcard-certificates-using-cloudflare-validation-on-centos-7](https://www.digitalocean.com/community/tutorials/how-to-retrieve-let-s-encrypt-ssl-wildcard-certificates-using-cloudflare-validation-on-centos-7)  
[https://wordpress.org/support/topic/activating-brought-white-screen-restoring-back-is-a-challenge/](https://wordpress.org/support/topic/activating-brought-white-screen-restoring-back-is-a-challenge/)  
[https://www.wpbeginner.com/wp-tutorials/how-to-add-ssl-and-https-in-wordpress/](https://www.wpbeginner.com/wp-tutorials/how-to-add-ssl-and-https-in-wordpress/)
