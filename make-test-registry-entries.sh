#!/bin/bash

NUM_OF_ENTRIES=1000

for num in $(seq 1 $NUM_OF_ENTRIES)
do
    var1="$num"
    var2="TestToken$num"
    var3="Description$num"
    var4="T$num"
    
    tmp=$(jq -n --arg var1 "$var1" --arg var2 "$var2" --arg var3 "$var3" --arg var4 "$var4" '
    {
    "subject": "$var1",
    "name": { "value": $var2 },
    "description": { "value": "$var3" },
    "acronym": { "value": "$var4" },
    "unit": { "value": { "decimals": 14, "name": "unit2" } },
    "url": { "value": "https://iohk.io" },
    "logo": { "value": "QWxtb3N0IGEgbG9nbw==" }
    }
    ')
    echo "$tmp" > "./registry/$num.json"
done
