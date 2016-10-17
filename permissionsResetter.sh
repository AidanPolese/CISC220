#!/bin/bash
#Manvir Grewal : 10193283
#Aiden Polese : 10197342
#Kathleen Abols : 10179548

#A script that compares current file permissions to old ones
#The user has the option to reset back to the old permissions
#Sample Usage: permissionResseter.sh (-s or -r) savedPermissions 
#-s outputs any changes
#-r resets permissions to one specified

#gets the latest savedPermissionX - so instead of taking a 2nd argument,
#the program could automatically use the latest permissions file
#not used in the current version
latestPerm(){
for file in *savedPermissions*;do
                suffix=${file##*s}
                if [[ $suffix -ge $i ]];then
                        i="$suffix"
                fi
        done
        echo "$i"
}

#prints permissions of file or dir
printPerm(){
        echo $(ls -ld $1 | awk '{print $1}')
}

#uses find to iterate through all dirs/subdirs & prints any permissions that have changed
iterfiledir(){

	#static elements of comparison chart
	echo " Old		 Current        File"
	
	#recursively iterates through directories and extracts file/dir names 
        find $pwd ! -path '*/\.*' -type f,d | sed 1d | sed s/"."/""/ | while read filename;do
                        
			filePath=${filename/#"/"/""} #removes / infront of path
                        file=$(basename $filePath) #extracts file name from path
			
			
			#gets current permissions using printPerm function
			currentFilePerm=$(echo $(printPerm $filePath))
			
			
			#gets old permission from userArg permissions file
			oldFilePerm=$(echo $(cat $1 | 
				grep "\<$file\>" |
					awk '{print $1}'))
			
			#prints out comparison between permissions + filepath
			if [[ $oldFilePerm != $currentFilePerm ]];then
				echo "$oldFilePerm	$currentFilePerm	$filePath"
			fi
                done
}


#resets file/dir permissions to savedPermissions
resetPerms(){
	
	#recursively iterates through directories and extracts file/dir names
        find $pwd ! -path '*/\.*' -type f,d | sed 1d | sed s/"."/""/ | while read filename;do

                        filePath=${filename/#"/"/""} #removes / infront of path
                        file=$(basename $filePath) #extracts file name from path


                        #gets current permissions using printPerm function
                        currentFilePerm=$(echo $(printPerm $filePath))


                        #gets old permission from userArg permissions file
                        oldFilePerm=$(echo $(cat $1 |
                                grep "\<$file\>" |
                                        awk '{print $1}'))

                   	#if permissions are different set file to old permission
                        if [[ $oldFilePerm != $currentFilePerm ]];then
                        	u=$(echo ${oldFilePerm:1:3} | tr -d '-')
				g=$(echo ${oldFilePerm:4:5} | tr -d '-')
				o=$(echo ${oldFilePerm:7:9} | tr -d '-')
				
				chmod u="$u",g="$g",o="$o" $filePath
      				echo "$file reset from $currentFilePerm to $oldFilePerm" 
                        fi
                done
		
}

#runProgram:
if [ $1 == '-s' ];then
	iterfiledir $2 
elif [ $1 == '-r' ];then
	resetPerms $2
fi         
#programFinished                                                                                                   
