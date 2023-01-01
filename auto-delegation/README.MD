Auto Delegation

### Start
```
git clone https://github.com/vinjan23/satseterror/auto-delegation.git
cd auto-delegation
chmod +x delegate.sh
```

### SetConfig
```
sudo nano delegate.sh
crontab -e
```

```
0 */1 * * * /delegate.sh
```

