#/!/bin/bash -x

echo "Welcome to Snake And Ladder Game"
START_POSITION=0;
END_POSITION=100;
playerPosition=0;
previousPosition=0;
updatedPosition=0;
countDiceRoll=0;

rollDice()
{
	countDiceRoll=$(( $countDiceRoll +1 ))
	diceValue=$(( RANDOM%6 + 1 ))
	option
}
option()
{
	local NO_PLAY_OPTION=0;
	local LADDER_OPTION=1;
	local SNAKE_OPTION=2;
	select_option=$(( RANDOM%3 ))
	if(( $select_option == $NO_PLAY_OPTION ))
	then
		noPlay
	elif(( $select_option == $LADDER_OPTION ))
	then
		ladder
	else
		snake
	fi
}
noPlay()
{
playerPosition=$previousPosition;
}
ladder()
{
updatedPosition=$(( $previousPosition + $diceValue ))
if(( $updatedPosition > $END_POSITION ))
then
        playerPosition=$previousPosition;
elif(( $updatedPosition == $END_POSITION ))
then
        playerPosition=$END_POSITION;
else
        playerPosition=$updatedPosition;
fi
previousPosition=$playerPosition;
}
snake()
{
updatedPosition=$(( $previousPosition - $diceValue ))
if(( $updatedPosition < $START_POSITION ))
then
	playerPosition=$START_POSITION;
else
	playerPosition=$updatedPosition;
fi
previousPosition=$playerPosition;
}

while [[ playerPosition -ge START_POSITION && playerPosition -lt END_POSITION ]]
do
	rollDice
        echo "Position After Every Roll Dice ---->"$playerPosition
done
echo "Total Number Of Dice Roll ---> "$countDiceRoll
