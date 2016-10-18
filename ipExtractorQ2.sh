#!/bin/bash
#Manvir Grewal : 10193283
#Aiden Polese : 10197342
#Kathleen Abols : 10179548
#Program: extracts local, private, and public ips from ifconfig and prints them

var=$(ifconfig | awk 'sub(/inet /,""){print $1}')
	
	#read var and grep for IPs that match and assign Local/Private to them
	echo "$var" | grep -e "127" -e "10" -e "192.168" | while read -r line ; do
                if [[ "$line" =~ ^127* ]]; then
                        echo "Local IP: $line"
                elif [[ "$line" =~ ^192.168.* || "$line" =~ ^10* ]];then
            		echo "Private IP: $line"           
		fi
        done
	
	#read var and grep for IPs that do not match - loop and assign public IP to them
	echo "$var" | grep -e "127" -e "10" -e "192.168" -v | while read -r line ; do
                echo "Public IP: $line"
        done
	
