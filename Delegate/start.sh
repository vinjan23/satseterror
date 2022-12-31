#!/bin/bash

source $HOME/.bash_profile
GREEN_COLOR='\033[0;32m'
RED_COLOR='\033[0;31m'
WITHOU_COLOR='\033[0m'
DELAY=300 #in secs - how often restart the script


for (( ;; )); do
        echo -e "Get reward from Delegation"
        echo -e "${PWDDD}\ny\n" | $PROJECT tx distribution withdraw-all-rewards --from ${WALLETNAME} --chain-id ${CHAIN_ID}  --gas ${FEES}${DENOM} --gas-prices 30000000000 --gas-adjustment 1.15
for (( timer=12; timer>0; timer-- ))
        do
                printf "* sleep for ${RED_COLOR}%02d${WITHOUT_COLOR} sec\r" $timer
                sleep 1
        done
BAL=$($PROJECT q bank balances ${DEL_ADDR} --output json | jq -r '.balances[] | select(.denom=="'${DENOM}'")' | jq -r .amount)
echo -e "BALANCE: ${GREEN_COLOR}${BAL}${WITHOU_COLOR} $DENOM\n"
        echo -e "Claim rewards\n"
        echo -e "${PWDDD}\n${PWDDD}\n" | $PROJECT tx distribution withdraw-all-rewards --from ${WALLETNAME} --chain-id ${CHAIN_ID} --gas ${FEES}${DENOM} --gas-prices 30000000000 --gas-adjustment 1.15
for (( timer=12; timer>0; timer-- ))
        do
                printf "* sleep for ${RED_COLOR}%02d${WITHOU_COLOR} sec\r" $timer
                sleep 1
        done
BAL=$($PROJECT q bank balances ${DEL_ADDR} --output json | jq -r '.balances[] | select(.denom=="'${DENOM}'")' | jq -r .amount)
        BAL=$(($BAL- 500))
echo -e "BALANCE: ${GREEN_COLOR}${BAL}${WITHOU_COLOR} ${DENOM}\n"
        echo -e "Stake ALL\n"
if (( BAL > 500 )); then
            echo -e "${PWDDD}\n${PWDDD}\n" | $PROJECT tx staking delegate ${VAL_ADDR} ${BAL}${DENOM} --from ${WALLETNAME} --chain-id ${CHAIN_ID} --gas ${FEES}${DENOM} --gas-prices 30000000000 --gas-adjustment 1.15
        else
                                echo -e "BALANCE: ${GREEN_COLOR}${BAL}${WITHOU_COLOR} $DENOM BAL < 0 ((((\n"
        fi
for (( timer=${DELAY}; timer>0; timer-- ))
        do
            printf "* sleep for ${RED_COLOR}%02d${WITHOU_COLOR} sec\r" $timer
            sleep 1
        done
done
