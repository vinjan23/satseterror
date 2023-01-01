#!/bin/bash

source $HOME/.bash_profile
GREEN_COLOR='\033[0;32m'
RED_COLOR='\033[0;31m'
WITHOU_COLOR='\033[0m'
DELAY=300 #in secs - how often restart the script


for (( ;; )); do
        echo -e "Get reward from Delegation"
        echo -e "${PWDDD}\ny\n" | planqd tx distribution withdraw-rewards --from jb --chain-id planq_7070-2  --gas 1000000 --gas-prices 30000000000 --gas-adjustment 1.15
for (( timer=12; timer>0; timer-- ))
        do
                printf "* sleep for ${RED_COLOR}%02d${WITHOUT_COLOR} sec\r" $timer
                sleep 1
        done
BAL=planqd q bank balances plq1923gyajfkyrt7xwh0p7zmfrdnnfrx6gmzhj3qj --output json | jq -r '.balances[] | select(.denom=="'${DENOM}'")' | jq -r .amount)
echo -e "BALANCE: ${GREEN_COLOR}${BAL}${WITHOU_COLOR} $DENOM\n"
        echo -e "Claim rewards\n"
        echo -e "${PWDDD}\n${PWDDD}\n" | planqd tx distribution withdraw-all-rewards --from jb --chain-id planq_7070-2  --gas 1000000 --gas-prices 30000000000 --gas-adjustment 1.15
for (( timer=12; timer>0; timer-- ))
        do
                printf "* sleep for ${RED_COLOR}%02d${WITHOU_COLOR} sec\r" $timer
                sleep 1
        done
BAL=planqd q bank balances plq1923gyajfkyrt7xwh0p7zmfrdnnfrx6gmzhj3qj --output json | jq -r '.balances[] | select(.denom=="'${DENOM}'")' | jq -r .amount)
        BAL=$(($BAL- 500))
echo -e "BALANCE: ${GREEN_COLOR}${BAL}${WITHOU_COLOR} ${DENOM}\n"
        echo -e "Stake ALL\n"
if (( BAL > 500 )); then
            echo -e "${PWDDD}\n${PWDDD}\n" | planqd tx staking delegate plqvaloper1923gyajfkyrt7xwh0p7zmfrdnnfrx6gmufltxr ${BAL}${DENOM} --from jb --chain-id planq_7070-2 --gas-adjustment 1.15 --gas=1000000 --gas-prices=30000000000aplanq 
 
        else
                                echo -e "BALANCE: ${GREEN_COLOR}${BAL}${WITHOU_COLOR} $DENOM BAL < 0 ((((\n"
        fi
for (( timer=${DELAY}; timer>0; timer-- ))
        do
            printf "* sleep for ${RED_COLOR}%02d${WITHOU_COLOR} sec\r" $timer
            sleep 1
        done
done
