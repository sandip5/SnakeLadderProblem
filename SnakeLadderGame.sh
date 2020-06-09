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
rollDice
}
ladder()
{
updatedPosition=$(( $previousPosition + $diceValue ))
}
snake()
{
updatedPosition=$(( $previousPosition - $diceValue ))
}

while [[ playerPosition -ge START_POSITION && playerPosition -le END_POSITION ]]
do
	rollDice	
done
