#Manvir Grewal : 10193283
#Aiden Polese : 10197342
#Kathleen Abols : 10179548

echo "This is a racing game, press 1,2 or 3 to move the arrows."

count1=0
count2=0
count3=0
keepPlaying=$true

while [ keepPlaying ] && (($count1<40)) && (($count2<40)) && (($count3<40)); do
        read -s -n 1 button
        clear
        if [ "$button" -eq "1" ]; then
                count1=$((count1+1))

        elif [ "$button" -eq "2" ]; then
                count2=$((count2+1))
        elif [ "$button" -eq "3" ]; then
                count3=$((count3+1))
        fi

        for ((i=1; i<=count1; i++)); do
                printf '~'; done
        printf "%0s%$((50-count1))s\n" "|->" "# Lane 1 #"

        for ((j=1; j<=count2; j++)); do
                printf '~'; done
        printf "%0s%$((50-count2))s\n" "|->" "# Lane 2 #"

        for ((k=1; k<=count3; k++)); do
                printf '~'; done
        printf "%0s%$((50-count3))s\n" "|->" "# Lane 3 #"
done

if (($count1==40)); then
        player=1
elif (($count2==40)); then
        player=2
else
        player=3
fi

echo Player $player has won!!!
