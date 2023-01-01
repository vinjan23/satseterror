Auto Delegation

### Start
```
wget -O delegate.sh https://raw.githubusercontent.com/vinjan23/satseterror/main/auto-delegation/delegate.sh && chmod +x delegate.sh && ./delegate.sh
```

### SetConfig
```
sudo nano delegate.sh
crontab -e
```

```
0 */1 * * * /delegate.sh
```

