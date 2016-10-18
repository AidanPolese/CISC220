#!/bin/bash
#Manvir Grewal : 10193283
#Aiden Polese : 10197342
#Kathleen Abols : 10179548
#A Script that saves current permissions of all files/subdirs etc.. into a savedPermissions file - to be used with permissionsResetter.sh


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

               
           
ls -lR | grep -v ^.: | grep -v ^t | awk '{print $1" "$NF}' | grep -v "./"> savedPermissions$(latestPerm)
