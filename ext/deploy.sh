#!/bin/bash

BRANCH=`git rev-parse --symbolic-full-name --abbrev-ref HEAD`

r10k deploy environment $BRANCH -p

if [ "$BRANCH" != "production" ];
then
  rm -rf /etc/puppetlabs/code/environments/production
  mv /etc/puppetlabs/code/environments/${BRANCH} /etc/puppetlabs/code/environments/production
fi
