#!/bin/bash

printf "\nDid you enter your Edge configuration information in ../../setup/setenv.sh? [y/n]: "
read setenv

if [ -z $setenv ] || [ "$setenv" = "y" ]; then
  printf ""
else  
  printf "\nYou must configure this file before continuing. See the README for details. Press Return to exit."
  read
  exit
fi


printf "\nDid you run the provisioning script ./provisioning/setup.sh? [y/n]: "
read setup

if [ -z $setup ] || [ "$setup" = "y" ]; then
  printf ""
else  
  printf "\nYou must run this script before continuing. See the README for details. Press Return to exit."
  read
  exit
fi

source ../../setup/setenv.sh

printf "\nEnter your password for the Apigee Enterprise organization $org, followed by [ENTER]: \n" 

read -s password

printf "\nGet API key (the Consumer Key) from the Learn Edge App. Press Return to continue: \n"
read

key=`curl -u $username:$password $url/v1/o/$org/developers/learn-edge-developer@example.com/apps/learn-edge-app 2>/dev/null \
     | grep consumerKey | awk -F '\"' '{ print $4 }'`


printf "\nThe API key (Consumer Key) for the Learn Edge App is $key\n"

printf "\nCall the API a bunch of times in a row. Press Return to contine:\n"
read

printf "\ncurl http://$org-$env.$api_domain/learn-edge/json?apikey=$key\n\nResponse:\n"

curl "http://$org-$env.$api_domain/learn-edge/json?apikey=$key"
printf "\n"
curl "http://$org-$env.$api_domain/learn-edge/json?apikey=$key"
printf "\n"
curl "http://$org-$env.$api_domain/learn-edge/json?apikey=$key"
printf "\n"
curl "http://$org-$env.$api_domain/learn-edge/json?apikey=$key"
printf "\n"
curl "http://$org-$env.$api_domain/learn-edge/json?apikey=$key"
printf "\n"
curl "http://$org-$env.$api_domain/learn-edge/json?apikey=$key"
printf "\n"
curl "http://$org-$env.$api_domain/learn-edge/json?apikey=$key"
printf "\n"
curl "http://$org-$env.$api_domain/learn-edge/json?apikey=$key"
printf "\n"
curl "http://$org-$env.$api_domain/learn-edge/json?apikey=$key"
printf "\n"
curl "http://$org-$env.$api_domain/learn-edge/json?apikey=$key"
printf "\n"
curl "http://$org-$env.$api_domain/learn-edge/json?apikey=$key"
printf "\n"

