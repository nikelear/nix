#!/usr/bin/env sh

alphabet="A B C D E F G H I J K L M N O P Q R S T U V W X Y Z"
word="Alpha Bravo Charlie Delta Echo Foxtrot Golf Hotel India Juliett Kilo Lima Mike November Oscar Papa Quebec Romeo Sierra Tango Uniform Victor Whiskey X-ray Yankee Zulu"

echo "Welcome to the NATO Phonetic Alphabet Game!"
echo "Enter the word corresponding to the given alphabet."
echo "Type 'quit' to end the game."

total_questions=0
correct_answers=0
consecutive_correct=0
accuracy=0

while true; do
    index=$(od -An -N2 -i /dev/urandom | awk '{ print $1 % 26 + 1 }')
    char=$(echo $alphabet | awk '{ print $'$index' }')
    answer=$(echo $word | awk '{ print $'$index' }')

    accuracy=$(awk -v correct=$correct_answers -v total=$total_questions 'BEGIN { printf "%.2f", (correct * 100 / total) }')

    echo ""
    echo "Consecutive correct answers: $consecutive_correct"
    echo "Accuracy: $accuracy%"
    echo "Alphabet: $char"
    printf "Enter the word: "
    read user_input

    user_input=$(echo "$user_input" | awk '{ print tolower($0) }')
    answer_lower=$(echo "$answer" | awk '{ print tolower($0) }')
    total_questions=$((total_questions + 1))

    case "$user_input" in

        quit|q|exit)
            echo "Ending the game. Thank you for playing!"
            break
            ;;

        "$answer_lower")
            echo "Correct!"
            correct_answers=$((correct_answers + 1))
            consecutive_correct=$((consecutive_correct + 1))
            ;;

        *)

            echo "Incorrect. The correct answer was $answer."
            consecutive_correct=0
            ;;

    esac



done
