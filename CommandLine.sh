#! /bin/zsh
COUNTRIES=("Italy" "Spain" "France" "England" "United States")

echo Information about places:
#Task 1
for place in "${COUNTRIES[@]}";do

	echo  Information about $place.
	#Task 1
	echo  Number of places:
	len=$(cut -f 8 places.tsv | grep "$place" | sort --unique | wc -l)
	echo $len
	
	#Task 2
	count=0
        for i in $(cut -f 3,8 places.tsv | grep "$place" | sort --unique | cut -f 1);do
                let count+=$i
        done
        avg=$(( $count/$len ))
	echo Average of people who have visited $place: $avg

	#Task 3
	tot=0
	for i in $(cut -f 4,8 places.tsv | grep "$place" | sort --unique | cut -f 1);do
		let tot+=$i
	done
	echo Total number of people who wants to visit $place: $tot

	echo -----------------------------------------------------------------
done

#Explanation:
#This section breafly explain what has been done in this script.
#First we've introduced an array comprising the countries we are interested in. Then we've used the cut command to get only the column corresponding to 'placeAddress' in our input file places.tsv.
#Then we've filtered them by using the grep command to search the desired pattern in the output of the cut command, and finally with the wc command we've retried the number of lines, i.e. the number 
#places in that particular country.
#In Task 2 we've used the cut command as we did in Task 1, in addition to that we've retrieved also the column corresponding the number of people who have visited the country. Finally we've summed 
#up all these values and divided by the number of places in that country.
#Finally in Task 3 we've applied the same idea of Task 1 and Task 2, and we've summed up all the filtered value from the column numWantvisit.


