#!/usr/bin/env bash

sudo snap install canonical-livepatch
wget https://github.com/Remmeauth/remprotocol/releases/download/0.1.0/remprotocol_0.1.0-ubuntu-18.04_amd64.deb && sudo apt install ./remprotocol_0.1.0-ubuntu-18.04_amd64.deb
wget https://testchain.remme.io/genesis.json
mkdir data && mkdir config
echo -e "plugin = eosio::chain_api_plugin\n\nplugin = eosio::net_api_plugin\n\nhttp-server-address = 0.0.0.0:8888\n\np2p-listen-endpoint = 0.0.0.0:9876\n\np2p-peer-address = 167.71.88.152:9877\n\nverbose-http-errors = true" > ./config/config.ini
rm -f ./Install-2.sh
remnode --config-dir ./config/ --data-dir ./data/ --delete-all-blocks --genesis-json genesis.json
