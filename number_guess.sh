#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

# Solicita o nome de usuário
echo "Enter your username:"
read USERNAME

# Verifica se o usuário existe no banco de dados
#USER_INFO=$($PSQL "SELECT user_id, games_played, best_game FROM users WHERE username='$USERNAME'")

#if [[ -z $USER_INFO ]]
then
  # Usuário novo
  echo "Welcome, $USERNAME! It looks like this is your first time here."
  # Insere o novo usuário no banco de dados
  #INSERT_USER_RESULT=$($PSQL "INSERT INTO users(username) VALUES('$USERNAME')")
 # USER_INFO=$($PSQL "SELECT user_id, games_played, best_game FROM users WHERE username='$USERNAME'")
else
  # Usuário existente
  echo $USER_INFO | while IFS="|" read USER_ID GAMES_PLAYED BEST_GAME
  do
    echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
  done
fi

# Gera um número aleatório entre 1 e 1000
SECRET_NUMBER=$(( RANDOM % 1000 + 1 ))
NUMBER_OF_GUESSES=0

# Pede ao usuário para adivinhar o número
echo "Guess the secret number between 1 and 1000:"

while true
do
  read GUESS

  # Verifica se a entrada é um número inteiro
  if [[ ! $GUESS =~ ^[0-9]+$ ]]
  then
    echo "That is not an integer, guess again:"
    continue
  fi

  # Incrementa o número de tentativas
  ((NUMBER_OF_GUESSES++))

  # Compara o palpite com o número secreto
  if [[ $GUESS -eq $SECRET_NUMBER ]]
  then
    echo "You guessed it in $NUMBER_OF_GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!"
    
    # Atualiza os dados do usuário no banco de dados
    USER_ID=$(echo $USER_INFO | cut -d '|' -f 1)
    GAMES_PLAYED=$(echo $USER_INFO | cut -d '|' -f 2)
    BEST_GAME=$(echo $USER_INFO | cut -d '|' -f 3)

    UPDATE_USER_RESULT=$($PSQL "UPDATE users SET games_played=$(($GAMES_PLAYED + 1)) WHERE user_id=$USER_ID")

    if [[ -z $BEST_GAME || $NUMBER_OF_GUESSES -lt $BEST_GAME ]]
    then
      UPDATE_BEST_GAME=$($PSQL "UPDATE users SET best_game=$NUMBER_OF_GUESSES WHERE user_id=$USER_ID")
    fi

    # Registra o resultado do jogo
    INSERT_GAME_RESULT=$($PSQL "INSERT INTO games(user_id, guesses) VALUES($USER_ID, $NUMBER_OF_GUESSES)")

    # Sai do loop
    break
  elif [[ $GUESS -lt $SECRET_NUMBER ]]
  then
    echo "It's higher than that, guess again:"
  else
    echo "It's lower than that, guess again:"
  fi
done