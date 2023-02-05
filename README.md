## 1/ Install shardeum validator

```
wget -O install-shardeum.sh https://raw.githubusercontent.com/calongtong/setup-shardeum/main/install-shardeum.sh && chmod +x install-shardeum.sh && ./install-shardeum.sh
```

## 2/ After finish install
cd /root/.shardeum
./shell.sh

### Start service ...
```
operator-cli gui start
operator-cli start
operator-cli gui status
operator-cli status
```


### For those of you whose node stops and who wants to set up an hourly cron job to check and restart the validator:

**1. Type this in you server terminal:**
```
cd ~/.shardeum
./shell.sh
```

**2. Now you're inside the container. Enter:**
```
sudo apt install nano cron
sudo /etc/init.d/cron start
echo -e '#!/bin/bash \nquery=$(pm2 list | grep stopped) \nif [[ -n $query ]]; then \n    operator-cli start \nfi' > restart.sh && sudo chmod +x restart.sh
crontab -e
```

**3.  Now a new crontab file is opened. Append this line to the end of the file:**
```
0 * * * * $HOME/app/restart.sh
```

**4. Now Ctrl+O, hit Enter then Ctrl+X**
That's it! 

