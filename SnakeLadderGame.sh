#/!/bin/bash -x
#Author ---->>> SANDIP SINGH <<<----
echo "Welcome to Snake And Ladder Game"
#CONSTANT
START_POSITION=0;
END_POSITION=100;
NO_PLAY_OPTION=0;
LADDER_OPTION=1;
SNAKE_OPTION=2;
#VARIABLES
playerPosition=0;
previousPosition=0;
updatedPosition=0;
playerOnePosition=0;
playerTwoPosition=0;
countDiceRoll=0;
#FUNCTION FOR ROLLING DICE
rollDice()
{
	countDiceRoll=$(( $countDiceRoll +1 ))
	diceValue=$(( RANDOM%6 + 1 ))
	option   #CALLING OPTION FUNCTION FOR CHOOSE OPTION
}
#FUNCTION FOR SELECT OPTION NO PLAY, LADDER AND SNAKE
option()
{
	select_option=$(( RANDOM%3 ))
	if(( $select_option == $NO_PLAY_OPTION ))
	then
		noPlay   #CALLING FUNCTION NOPLAY
	elif(( $select_option == $LADDER_OPTION ))
	then
		ladder   #CALLING FUNCTION LADDER
	else
		snake    #CALLING FUNCTION SNAKE
	fi
}
#FUNCTION FOR NOPLAY
noPlay()
{
playerPosition=$previousPosition;
}
#FUNCTION FOR LADDER
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
#FUNCTION FOR SNAKE
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
#FUNCTION FOR PLAYER ONE
playerOne()
{
rollDice   #CALLING ROLLDICE FUNCTION
}
#FUNCTION FOR PLAYER TWO
playerTwo()
{
rollDice   #CALLING ROLLDICE FUNCTION
}
while [[ playerPosition -ge START_POSITION && playerPosition -lt END_POSITION ]]
do
	playerOne    #CALLING PLAYER ONE FUNCTION
	if(( $select_option == $LADDER_OPTION ))
	then
		playerOne #CALLING PLAYER ONE FUNCTION 
	fi
	playerOnePosition=$playerPosition;
	playerPosition=$playerTwoPosition;
        echo "Player One,Position After Every Roll Dice ---->"$playerOnePosition
	if(( $playerOnePosition == $END_POSITION ))
	then
		echo "<<<===========*** PLAYER ONE WIN ***=============>>>"
		break
	fi
	playerTwo    #CALLING PLAYER TWO FUNCTION
	if(( $select_option == $LADDER_OPTION ))
        then
                playerTwo    #CALLING PLAYER TWO FUNCTION
        fi
	playerTwoPosition=$playerPosition;
	playerPosition=$playerOnePosition;
        echo "Player Two,Position After Every Roll Dice ---->"$playerTwoPosition
        if(( $playerTwoPosition == $END_POSITION ))
        then
		echo "<<<===========*** PLAYER TWO WIN ***=============>>>"
		break
        fi
done
echo "Total Number Of Dice Roll ---> "$countDiceRoll
