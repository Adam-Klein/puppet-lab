#!/bin/bash

myping=$(ping -c 1 proxy.standard.com | grep icmp | wc -l)

if [ $myping == 1 ]; then

else 
fi
