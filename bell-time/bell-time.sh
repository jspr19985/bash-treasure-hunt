echo "Calculating time..."
watch=$1
bells=$2

echo "You are on $watch watch."
echo "The bell has rang $bells times."

formatTime(){
    if [ "${#1}" -eq 3 ]
    then
       echo "The time in 24hr clock is 0$1 hours."
    elif [ "${#1}" -eq 2 ]
    then
       echo "The time in 24hr clock is 00$1 hours."
    else 
       echo "The time in 24hr clock is $1 hours."
    fi
}
printTime(){
    if [ $watch = "second-dog" ] && [ $bells -eq 8 ]
    then
       formatTime 2000
    elif [ $(($bells%2)) -eq 0 ]
    then
        time=$(($bells/2*100 +$1)) 
        formatTime $time
    else
	if [ "$bells" -gt 1 ]
	then
           time=$((($bells-1)/2*100+30 + $1)) 
           formatTime $time
        else
           time=$((($bells-1)*100+30 + $1))
           formatTime $time
	fi
    fi
}


if [ $bells -gt 8 ]
then 
   echo "No more than 8 bells are ever rung."
elif [ $watch = "middle" ]
then
   printTime 0000
elif [ $watch = "morning" ]
then
   printTime 400
elif [ $watch = "forenoon" ]
then
   printTime 800
elif [ $watch = "afternoon" ]
then
   printTime 1200
elif [ $watch = "first-dog" ]
then
   if [ $bells -gt 4 ]
   then
      echo "No more than 4 bells are rung during First Dog Watch."
   else
      printTime 1600
   fi
elif [ $watch = "second-dog" ]
then
   if [ $bells -gt 3 ] && [ $bells -lt 8 ]
   then
      echo "Invalid number of bells for Second Dog Watch."
   else
      printTime 1800
   fi
elif [ $watch = "first" ]
then
   printTime 2000
fi
