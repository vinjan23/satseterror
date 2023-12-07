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
        server_name snapshot.vinjan.xyz; 

	location / {
                # First attempt to serve request as file, then
                # as directory, then fall back to displaying a 404.
                # try_files $uri $uri/ =404;
                root /var/www/snapshot/;
                autoindex on;

    }
}
```
```
server {
        root /var/www/html;
        index index.html index.htm index.nginx-debian.html;
        server_name snap.vinjan.xyz; 

	location / {
                # First attempt to serve request as file, then
                # as directory, then fall back to displaying a 404.
                # try_files $uri $uri/ =404;
                root /var/www/snap/;
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

3. Masuk `www` make folder `snapshot``snap`

4. Masuk `snapshot` make folder `<chain>`

### Prune
```
cd cosmprund
sudo systemctl stop ###
./build/cosmprund prune ~/.***/data --cosmos-sdk=false
```

Make snapshot file
 ```
cd $HOME/.***
```

```
tar -cf - data | lz4 > /var/www/snapshot/***/***-snapshot-$(date +%Y%m%d).tar.lz4
```

### Command
```
sudo apt install lz4 -y
sudo systemctl stop mantrachaind
mantrachaind tendermint unsafe-reset-all --home $HOME/.mantrachain --keep-addr-book
curl -L https://snapshot.vinjan.xyz/mantrachain/mantrachain-snapshot-20230926.tar.lz4 | lz4 -dc - | tar -xf - -C $HOME/.mantrachain
sudo systemctl restart mantrachaind
journalctl -fu mantrachaind -o cat
```











