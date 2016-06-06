#!/bin/bash

myping=$(ping -c 1 proxy.standard.com | grep icmp | wc -l)

if [ $myping == 1 ]; then
  echo "Proxy detected - setting up proxy settings on node"
cat >> /etc/bashrc <<EOH
export http_proxy=http://proxy.standard.com:8080
export https_proxy=http://proxy.standard.com:8080
export no_proxy=localhost,127.0.0.1
EOH
else
  echo "No proxy detected. Moving along..."
fi