#!/bin/bash
cd /snap
for i in */ ; do
        if [[ $i == "bin/" ]]
        then
                num=1
        else
                num=$(ls "$i" | wc | awk '{print $1}')
        fi
        if [[ $num == "3" ]]
        then
                old=$(ls "$i" | head -n1)
                snap=$(echo $i | sed 's/.$//')
                echo "Borrando la revisión $old del snap $snap"
                snap remove --revision=$old $snap 
        fi
done
