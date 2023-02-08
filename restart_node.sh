#!/bin/bash
PATH=$PATH:/usr/local/bin
echo `date +%d/%m/%Y\ %H:%M:%S`;
echo -e "\nCheck service started or not "
query22=$(/usr/local/bin/pm2 list | grep operator-gui | grep stopped) 
if [[ -n $query22 ]]; then 
    echo -e "\nGUI stopped --> Start GUI again ...";	   
    /usr/local/bin/node /usr/local/bin/operator-cli gui start
    sleep 1
    echo -e "\nGUI started"
else
    echo -e "\nGUI still running"
fi

query32=$(/usr/local/bin/pm2 list | grep "validator" | grep stopped)
if [[ -n $query32 ]]; then 
    echo -e "\nValidatorstopped --> Start Validator again ...";	   
    /usr/local/bin/node /usr/local/bin/operator-cli start;
    sleep 2
    echo -e "\nValidator started!"
else
    echo -e "\nValidator still running"
fi
