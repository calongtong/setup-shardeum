#!/bin/bash
echo `date +%d/%m/%Y\ %H:%M:%S`;
echo -e "\nCheck service started or not "
query21=$(/usr/local/bin/pm2 list | grep "operator-gui") 
if [[ -z $query21 ]]; then 
    echo -e "\nOperator GUI not start --> Starting Operator GUI ... ";	   
    operator-cli gui start;
    sleep 1
    echo -e "\nGUI started!"
fi

# Check service is stop or not
query22=$(/usr/local/bin/pm2 list | grep operator-gui | grep stopped) 
if [[ -n $query22 ]]; then 
    echo -e "\nGUI stopped --> Start GUI again ...";	   
    operator-cli gui start
    sleep 1
    echo -e "\nValidator started"
fi

query31=$(/usr/local/bin/pm2 list | grep "validator") 
if [[ -n $query31 ]]; then 
    echo -e "\nValidator not start --> Starting Validator ... ";	   
    operator-cli  start;
    sleep 2
    echo -e "\nValidator started!"
fi

query32=$(/usr/local/bin/pm2 list | grep "validator" | grep stopped) 
if [[ -n $query32 ]]; then 
    echo -e "\nValidatorstopped --> Start Validator again ...";	   
    operator-cli start;
    sleep 2
    echo -e "\nValidator started!"
fi
