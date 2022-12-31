#!/bin/bash

while true
do

# Logo

echo "============================================================"
curl -s https://raw.githubusercontent.com/StakeTake/script/main/logo.sh | bash
echo "============================================================"


PS3='Select an action: '
options=(
"Setup parametrs for autodelegator" 
"Start autodelegator"
"Exit")
select opt in "${options[@]}"
               do
                   case $opt in
       
"Setup parametrs for autodelegator")
echo "============================================================"
echo "Setup service of project, example - umeed"
echo "============================================================"
read PROJECT
echo export PROJECT=${PROJECT} >> $HOME/.bash_profile
echo "============================================================"
echo "Setup your wallet name"
echo "============================================================"
read WALLETNAME
echo export WALLETNAME=${WALLETNAME} >> $HOME/.bash_profile
echo "============================================================"
echo "Setup your password of wallet"
echo "============================================================"
read PWDDD
echo export PWDDD=${PWDDD} >> $HOME/.bash_profile
echo "============================================================"
echo "Enter the password of wallet for set the validator address"
echo "============================================================"
VAL_ADDR=$($PROJECT keys show $WALLETNAME --bech val -a)
echo export VAL_ADDR=${VAL_ADDR} >> $HOME/.bash_profile
echo "============================================================"
echo "Enter the password of wallet for set the delegator address"
echo "============================================================"
DEL_ADDR=$($PROJECT keys show $WALLETNAME --bech acc -a)
echo export DEL_ADDR=${DEL_ADDR} >> $HOME/.bash_profile
echo "============================================================"
echo "Setup denom of token, example - uumee"
echo "============================================================"
read DENOM
echo export DENOM=${DENOM} >> $HOME/.bash_profile
echo "============================================================"
echo "Set the fees amount per transaction"
echo "============================================================"
read FEES
echo export FEES=${FEES} >> $HOME/.bash_profile
echo "============================================================"
echo "Setup your chain id, example - umee-1"
echo "============================================================"
read CHAIN_ID
echo export CHAIN_ID=${CHAIN_ID} >> $HOME/.bash_profile
source $HOME/.bash_profile


mkdir $HOME/autodelegate
wget -O $HOME/autodelegate/start.sh https://raw.githubusercontent.com/StakeTake/scriptcosmos/main/autodelegator/start.sh
chmod +x $HOME/autodelegate/start.sh
break
;;
            
"Start autodelegator")
echo "============================================================"
echo "Bot strating"
echo "============================================================"
apt install screen
screen -S AutoDelegate

break
;;

"Exit")
exit
;;

*) echo "invalid option $REPLY";;
esac
done
done
