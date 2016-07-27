#!/bin/bash

# r10k deploy environment production -p
r10k deploy environment Practice_1 -p
rm -rf /etc/puppetlabs/code/environments/production && mv /etc/puppetlabs/code/environments/Practice_1 /etc/puppetlabs/code/environments/production
