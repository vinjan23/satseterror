### Package
```
sudo apt update && sudo apt upgrade -y
sudo apt install nginx certbot python3-certbot-nginx -y
curl -fsSL https://deb.nodesource.com/setup_16.x | sudo -E bash -
sudo apt-get install -y nodejs git
curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | gpg --dearmor | sudo tee /usr/share/keyrings/yarnkey.gpg >/dev/null
echo "deb [signed-by=/usr/share/keyrings/yarnkey.gpg] https://dl.yarnpkg.com/debian stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt-get update && sudo apt-get install yarn -y
```
### Make config
```
nano /etc/nginx/sites-enabled/<YOUR.RPC.SUBDOMAIN.SITE>.conf
```
```
server {
        root /var/www/html;
        index index.html index.htm index.nginx-debian.html;
        server_name snapshot-2.vinjan.xyz; 

	location / {
                # First attempt to serve request as file, then
                # as directory, then fall back to displaying a 404.
                # try_files $uri $uri/ =404;
                root /var/www/snapshot/;
                autoindex on;

    }
}
```
### Test Config
```
sudo pkill nginx
nginx -t
```
### Instal ssl
```
sudo certbot --nginx --register-unsafely-without-email
sudo certbot --nginx --redirect
```

1. Tekan `T`
 
2. Masuk `var` make folder `www`

3. Masuk `www` make folder `snapshot`

4. Masuk `snapshot` make folder `<chain>`

5. Make snapshot file
 ```
sudo apt install lz4
cd $HOME/.planqd
sudo systemctl stop planqd
```

```
tar -cf - data | lz4 > /var/www/snapshot/planq/planq-snapshot-$(date +%Y%m%d).tar.lz4
```

### Command
```
sudo apt install lz4 -y
sudo systemctl stop planqd
```
```
planqd tendermint unsafe-reset-all --home $HOME/.planqd --keep-addr-book
curl -L https://snap.planq.jepe.biz.id/planq/planq-snapshot-20230131.tar.lz4 | lz4 -dc - | tar -xf - -C $HOME/.planqd

```

```
sudo systemctl restart planqd
journalctl -fu planqd -o cat
```











