#!/bin/bash

#identify most recent savedPermissions file and record the number
latestPerm(){
        for file in *savedPermissions*;do
                suffix=${file##*s}
                if [[ $suffix -ge $i ]];then
                        i="$suffix"
                fi
        done	
	echo "$i"
}


	#touch currentPerms
	#for files in *;do
	#	stat -f "%Lp %N" $files  >> currentPerms
	#done



#creates a new savedPermission file everytime it is run suffix added: 1,2,3...
if ! [ -e "savedPermissions" ];then
	touch "savedPermissions"
	echo "savedPermissions created"
elif [ -e "savedPermissions1" ];then
	i=$(latestPerm)
	((i++))
	touch "savedPermissions$i"
	echo "savedPermissions$i created"
else
	touch "savedPermissions1"
	echo "savedPermissions1 created"
fi

               
           
ls -lR | awk '{print $1" "$NF}'| grep -v ^t > savedPermissions$(latestPerm)
