#! /bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

#generate random number
GUESSING_NUMBER=$(( (RANDOM % 1000) + 1 ))
GUESS_TIME=0

echo -e "\n~~~number guessing game~~~\n"
echo "Enter your username:"
read USERNAME
#check if the user have played before.
#get user name
NAME=$($PSQL "SELECT name FROM users WHERE name = '$USERNAME'")
if [[ -z $NAME ]]
then
  INSERT_USERNAME_RESULT=$($PSQL "INSERT INTO users(name) VALUES('$USERNAME')")
  echo -e "\nWelcome, $USERNAME! It looks like this is your first time here."
else
  GAME_PLAYED=$($PSQL "SELECT COUNT(win_round) FROM users JOIN games USING(name_id) WHERE name = '$NAME'")
  BEST_GAME=$($PSQL "SELECT MIN(win_round) FROM users JOIN games USING(name_id) WHERE name = '$NAME'")
  echo -e "\nWelcome back, $NAME! You have played $GAME_PLAYED games, and your best game took $BEST_GAME guesses."
fi

#game start
GAME() {
  GUESS_TIME=0
  echo -e "Guess the secret number between 1 and 1000:"
  GAME_GUESS
}

GAME_GUESS() {
  read USER_GUESS
  if [[ $USER_GUESS =~ ^[0-9]+$ ]]
  then
    if [[ $USER_GUESS != $GUESSING_NUMBER ]]
    then
      if [[ $USER_GUESS > $GUESSING_NUMBER ]]
      then
        echo -e "\nIt's higher than that, guess again:"
        ((GUESS_TIME++))
        GAME_GUESS
      else
        echo -e "\nIt's lower than that, guess again:"
        ((GUESS_TIME++))
        GAME_GUESS
      fi
    else
      ((GUESS_TIME++))
      #get name id
      NAME_ID=$($PSQL "SELECT name_id FROM users WHERE name = '$USERNAME'")
      INSERT_GAMES_RESULT=$($PSQL "INSERT INTO games(win_round, name_id) VALUES($GUESS_TIME, $NAME_ID)")
      echo -e "\nYou guessed it in $GUESS_TIME tries. The secret number was $GUESSING_NUMBER. Nice job!"
    fi
  else
    echo -e "\nThat is not an integer, guess again:"
    GAME_GUESS
  fi
}
#start game.
GAME