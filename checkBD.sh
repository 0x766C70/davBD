#!/bin/bash

davDir="/home/vlp/.contacts/default/"

myDate=$(date +"%m%d")

for file in "$davDir"*
	do
		if [[ -f $file ]]; then
			bd=$( sed -n 's/^BDAY://p'  $file | tr -d '-' | tr -d '\r' |  grep -o '....$' )
			if [[ "$bd" != "" ]]; then
				if [[ "$myDate" == "$bd" ]]; then
					fn=$( sed -n 's/^FN://p'  $file )
					echo $fn
				fi
			fi
		fi
done
