#!/bin/bash

#################################
## Begin of user-editable part ##
#################################

POOL=eu1.ethermine.org:4444
WALLET=0xd6d93EA98CD6688d885f4aBad0772f45f807DB89.lolMinerWorker

#################################
##  End of user-editable part  ##
#################################

cd "$(dirname "$0")"

./lolMiner --algo ETHASH --pool $POOL --user $WALLET $@
while [ $? -eq 42 ]; do
    sleep 10s
    ./lolMiner --algo ETHASH --pool $POOL --user $WALLET $@
done
