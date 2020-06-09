#/!/bin/bash -x

echo "Welcome to Snake And Ladder Game"
START_POSITION=0;
END_POSITION=100;
playerPosition=0;
previousPlayerPosition=0;
updatedPlayerPosition=0;
countDiceRoll=0;

rollDice()
{
	dice=$(( RANDOM%6 + 1 ))
}

while [[ playerPosition -ge START_POSITION && playerPosition -le END_POSITION ]]
do
	rollDice
	echo $dice
done
