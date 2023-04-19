# Word Guessing Game

This is a word guessing game built with Assembly language. The program will randomly select a word from a list of words and provide the user with hints to guess the word. The user will have 3 attempts to guess the word correctly.

## Getting Started

To run the program, you will need an assembly language compiler that supports the x86 architecture. Once you have the compiler installed, download or clone the repository and compile the code using the following command:

nasm -f elf32 wordguess.asm && gcc -m32 -o wordguess wordguess.o



After compiling, run the program by executing the following command:

./wordguess

## How to Play

1. The program will select a random word from a list of words and display the number of characters in the word using underscores.
2. The user must guess a letter that they think is in the word. If the letter is correct, the program will replace any underscore with that letter in the correct position.
3. If the letter is incorrect, the program will decrement the number of attempts remaining.
4. The user will continue to guess letters until they either correctly guess the word or run out of attempts.
5. If the user correctly guesses the word, the program will display a success message and ask if they want to play again. If they run out of attempts, the program will display a failure message and show the correct word.

## Notes

- The list of words can be customized by modifying the words array in the source code.
- The game currently only supports single-word answers without spaces or special characters.


## Future Improvements

- Support for multi-word answers with spaces and special characters.
- Displaying ASCII art related to the current word being guessed.
- Adding sound effects and background music.
- Implementing a high score leaderboard.
