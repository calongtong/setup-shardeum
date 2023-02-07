#!/bin/bash
echo `date +%d/%m/%Y\ %H:%M:%S`;
query=$(/usr/local/bin/pm2 list | grep validator | grep stopped) 
if [[ -n $query ]]; then 
    echo -n "#Validator stopped --> Start validator again ...";	   
    operator-cli start;
fi

query2=$(/usr/local/bin/pm2 list | grep "operator-gui" | grep stopped) 
if [[ -n $query2 ]]; then 
    echo -n "#Operator GUI stopped --> Start Operator GUI again ...";	   
    operator-cli gui start;
fi
