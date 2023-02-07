# In docker container instance 
sudo apt install cron vim -y
sudo /etc/init.d/cron start

wget -O $HOME/app/restart_node.sh https://raw.githubusercontent.com/calongtong/setup-shardeum/main/restart_node.sh && chmod +x $HOME/app/restart_node.sh

(crontab -l 2>/dev/null; echo "*/5 * * * * /home/node/app/restart_node.sh >> /home/node/app/check_node.log 2>&1") | crontab -
