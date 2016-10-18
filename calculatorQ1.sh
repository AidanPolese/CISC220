#!/bin/bash
#Manvir Grewal : 10193283
#Aiden Polese : 10197342
#Kathleen Abols : 10179548
#Simple Calculator Program
echo Welcome to Question 1

loopEnd=1

#will take a number from the user
read -p "Please insert a number: " num1

#will check for the quit command
if [[ $num1 == ":q" ]]; then
	echo "Thanks for using my calculator"
	exit
fi

#checks to see if the  entered value is an integer
until [[ $num1 =~ ^-?[0-9]+$ ]]
do
	echo That is not a valid number
	read -p "Please insert a number: " num1

	if [[ $num1 == ":q" ]]; then
        	echo "Thanks for using my calculator"
        	exit
	fi

done

#a variable reassignment that allows for the running total to be calculated
resultSoFar=$num1

#gets what arithmetic operation the user would like to use
read -p "Please insert an operator (plus,min,mult,div): " oper

#checks for the quit command
if [[ $oper == ":q" ]]; then
        echo "Thanks for using my calculator"
        exit
fi

#checks to see if the operator given is supported
until [[ $oper =~ ^["plus","min","mult","div"]+$ ]]
do
	echo That is not a valid operator
	read -p "Please insert an operator (plus,min,mult,div): " oper

	if [[ $oper == ":q" ]]; then
                echo "Thanks for using my calculator"
                exit
        fi
done

#takes a second number from the user
read -p "Please insert a number: " num2

#checks for quit command
if [[ $num2 == ":q" ]]; then
        echo "Thanks for using my calculator"
        exit
fi

#Checks to see if the value given is a valid number
until [[ $num2 =~ ^-?[0-9]+$ ]]
do
        echo That is not a valid number
        read -p "Please insert a number: " num2

	if [[ $num2 == ":q" ]]; then
                echo "Thanks for using my calculator"
                exit
        fi
done

#performs the correct arithmetic based off the given operation
if [ $oper == "plus" ]; then
        resultSoFar=$(($resultSoFar + $num2))
        echo "The running total so far is:" $resultSoFar
elif [ $oper == "min" ]; then
        resultSoFar=$(($resultSoFar - $num2))
        echo "The running total so far is:" $resultSoFar
elif [ $oper == "mult" ]; then
        resultSoFar=$(($resultSoFar * $num2))
        echo "The running total so far is:" $resultSoFar
elif [ $oper == "div" ]; then
        resultSoFar=$(($resultSoFar / $num2))
        echo "The running total so far is:" $resultSoFar
fi

#a loop is opened so that the user may use the calculator as long as they wish
while [[ $loopEnd != 2 ]];
do

#operator given by user
read -p "Please insert an operator (plus,min,mult,div): " oper

if [[ $oper == ":q" ]]; then
        echo "Thanks for using my calculator"
        exit
fi

until [[ $oper =~ ^["plus","min","mult","div"]+$ ]]
do
        echo That is not a valid operator
        read -p "Please insert an operator (plus,min,mult,div): " oper

	if [[ $oper == ":q" ]]; then
                echo "Thanks for using my calculator"
                exit
        fi
done

#number given by user
read -p "Please insert a number: " num2

if [[ $num2 == ":q" ]]; then
        echo "Thanks for using my calculator"
        exit
fi

until [[ $num2 =~ ^-?[0-9]+$ ]]
do
        echo That is not a valid number
        read -p "Please insert a number: " num2

	if [[ $num2 == ":q" ]]; then
                echo "Thanks for using my calculator"
                exit
        fi
done

#arithmetic based on giuven values is performed
if [ $oper == "plus" ]; then
	resultSoFar=$(($resultSoFar + $num2))
	echo "The running total so far is:" $resultSoFar
elif [ $oper == "min" ]; then
	resultSoFar=$(($resultSoFar - $num2))
	echo "The running total so far is:" $resultSoFar
elif [ $oper == "mult" ]; then
	resultSoFar=$(($resultSoFar * $num2))
	echo "The running total so far is:" $resultSoFar
elif [ $oper == "div" ]; then
	resultSoFar=$(($resultSoFar / $num2))
	echo "The running total so far is:" $resultSoFar
fi

done
