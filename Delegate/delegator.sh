#!/bin/bash

while true
do

# Logo

echo -e "\033[0;35m"
echo "   #           #  o  #        #          #       #        #        #    ";
echo "    #         #   #  #  #     #          #      #  #      #  #     #    ";
echo "     #       #    #  #   #    #          #     #    #     #   #    #    ";
echo "      #     #     #  #     #  #          #    #  # # #    #     #  #    ";
echo "       #   #      #  #      # #          #   #        #   #      # #    ";
echo "         #        #  #        #   # # # #   #          #  #        #    ";
echo -e "\e[0m"


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
echo "Setup service of project, example - uheart"
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
DEL_ADDR=$($PROJECT keys show $WALLETNAME -a)
echo export DEL_ADDR=${DEL_ADDR} >> $HOME/.bash_profile
echo "============================================================"
echo "Setup denom of token, example - uumee"
echo "============================================================"
read DENOM
echo export DENOM=${DENOM} >> $HOME/.bash_profile
echo "============================================================"
echo "Set the gas amount per transaction"
echo "============================================================"
read GAS
echo export GAS=${GAS} >> $HOME/.bash_profile
echo "============================================================"
echo "Set the gas price amount per transaction"
echo "============================================================"
read GAS
echo export GAS=${GAS_PRICE} >> $HOME/.bash_profile
echo "============================================================"
echo "Set the gas adjustment amount per transaction"
echo "============================================================"
read GAS
echo export GAS=${GAS_AD} >> $HOME/.bash_profile
echo "============================================================"
echo "Setup your chain id, example - umee-1"
echo "============================================================"
read CHAIN_ID
echo export CHAIN_ID=${CHAIN_ID} >> $HOME/.bash_profile
echo "============================================================"
source $HOME/.bash_profile


mkdir $HOME/autodelegate
wget -O $HOME/autodelegate/start.sh https://raw.githubusercontent.com/vinjan23/satseterror/main/Delegate/start.sh
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
