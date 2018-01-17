# Tic-tac-toe

(aka 'noughts and crosses' or 'Xs and Os')

Welcome to my Tic-tac-toe game written in the beautiful language Ruby

### Let's Play!

#### Rules

This is a two-player game. The object of the game is to win by placing your mark ('X' or 'O') in a contiguous sequence to form a horizontal, vertical, or diagonal row before your opponent. If the board becomes full before either player can achieve a win, then the game is a 'tie'.

The typical board size of a Tic-tac-toe game is a 3x3 board but my program can handle up to a 9x9 board if you have the urge to play a long game session.

Player 'X' will always be the first to mark the board, then Player 'O' will follow alternating turns until there is a winner or a tie.

Here is a sample of an empty 3x3 board:

```
_01_|_02_|_03_|

_04_|_05_|_06_|

_07_|_08_|_09_|
```

#### Setup

To start the game, run `ruby tic-tac-toe.rb` within the root directory.

You will be prompted to provide a size for the board

`Please provide a number for the board size to build a proportional board: `

A welcome message will appear, the empty board will be displayed, and Player X will be asked for their move

```
Welcome to TicTacToe! Player 1 is 'X' and Player 2 is 'O'.

_01_|_02_|_03_|

_04_|_05_|_06_|

_07_|_08_|_09_|

Player X's turn:
```

To place your mark on the board, enter the number for the corresponding space. For numbers 1-9, the leading zero is optional.

Here is an example of a partially filled 3x3 board:
```
_ X_|_ O_|_03_|

_ X_|_05_|_06_|

_ O_|_08_|_ X_|
```
