#!/bin/bash

PS3='Please enter your choice ("6" to exit): '
options=("relay 1 on" "relay 1 off" "relay 2 on" "relay 2 off" "power cycle chamber" "exit")
select opt in "${options[@]}"
do
    case $opt in
        "relay 1 on")
            $(usbrelay rlay_1=0)
            echo "you chose choice $REPLY which is $opt"
            ;;
        "relay 1 off")
            $(usbrelay rlay_1=1)
            echo "you chose choice $REPLY which is $opt"
            ;;
        "relay 2 on")
            $(usbrelay rlay_2=0)
            echo "you chose choice $REPLY which is $opt"
            ;;
        "relay 2 off")
            $(usbrelay rlay_2=1)
            echo "you chose choice $REPLY which is $opt"
            ;;
        "power cycle chamber")
            $(usbrelay rlay_1=1)
            $(usbrelay rlay_2=1)
            read -r -p "Please wait 5 seconds..." -t 5 -n 1 -s
            $(usbrelay rlay_1=0)
            $(usbrelay rlay_2=0)
            echo "you chose choice $REPLY which is $opt"
            ;;
        "exit")
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done
