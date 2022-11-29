# Setting API & RPC

1. Install Packages
```
sudo apt update && sudo apt upgrade -y
sudo apt install nginx certbot python3-certbot-nginx -y
curl -fsSL https://deb.nodesource.com/setup_16.x | sudo -E bash -
sudo apt-get install -y nodejs git
curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | gpg --dearmor | sudo tee /usr/share/keyrings/yarnkey.gpg >/dev/null
echo "deb [signed-by=/usr/share/keyrings/yarnkey.gpg] https://dl.yarnpkg.com/debian stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt-get update && sudo apt-get install yarn -y
```

2. Config API
```
nano /etc/nginx/sites-enabled/<YOUR.API.SUBDOMAIN.SITE>.conf
```

3. Copy Example and Edit

```
N/A
```

4. Config RPC
```
nano /etc/nginx/sites-enabled/<YOUR.RPC.SUBDOMAIN.SITE>.conf
```

5. Copy and Edit
```
N/A
```

6. Check Config
```
cat /etc/nginx/sites-enabled/neutron-rpc*
cat /etc/nginx/sites-enabled/neutron-api*
cat /etc/nginx/sites-enabled/YourDomain*
```

7. Configuration
```
cp ~/explorer/ping.conf /etc/nginx/sites-enabled/<DOMAIN_EXPLORER>.conf
```

8. Edit config
```
nano /etc/nginx/sites-enabled/<DOMAIN_EXPLORER>.conf
```

9. Test Config
```
nginx -t 
```
** Jika konfigurasinya benar seperti ini** nginx: the configuration file /etc/nginx/nginx.conf syntax is ok nginx: configuration file /etc/nginx/nginx.conf test is successful


10. Install SSL 
```
sudo certbot --nginx --register-unsafely-without-email
sudo certbot --nginx --no-redirect
```

11. Restart
```
systemctl restart nginx
```

delete domain : rm -f /etc/nginx/sites-enabled/{jepe*,default}



Special Thanks to @jambulmerah




