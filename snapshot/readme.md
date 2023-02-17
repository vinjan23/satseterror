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

6. Make config
```
nano /etc/nginx/sites-enabled/<YOUR.RPC.SUBDOMAIN.SITE>.conf
```

```
server {
        root /var/www/html;
        index index.html index.htm index.nginx-debian.html;
        server_name snapshot.planq.vinjan.xyz; 

	location / {
                # First attempt to serve request as file, then
                # as directory, then fall back to displaying a 404.
                # try_files $uri $uri/ =404;
                root /var/www/snapshot/;
                autoindex on;

    }
}
```

7. Instal ssl
```
sudo certbot --nginx --register-unsafely-without-email
sudo certbot --nginx --redirect
```

8. Start
```
sudo systemctl start nginx
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











