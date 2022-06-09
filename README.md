 Welcome to Tic-Tac_toe! <br />
>Installation and Running
<br />

To run, clone repo, cd into directory and run this command: "ruby src/main.rb"
<br />
<br />


>Game play and features
>
You have the ability to select between playing against an other human or a CPU.
![TTT welcome screen](https://user-images.githubusercontent.com/104442990/172941910-373e52c4-ff50-4da3-afa3-7eb50ab8fd08.png)

Both human players will have the opportunity to enter their names, select their mark and select their position as player one or two.
* Note: player one always goes first.

![Player name enter](https://user-images.githubusercontent.com/104442990/172941912-a0428211-84bd-411c-ac12-93ecccd4dc35.png)
![second player name enter](https://user-images.githubusercontent.com/104442990/172941917-c4ad9fd3-461c-4dc2-9fb8-a36692612142.png)
* Note: Second players mark and position are automatically selected to the opposite of what player one choose. Player two only need to enter their name.

As a player, you will be able to pick board sizes from 3x3 by default up to 5x5.
![](https://user-images.githubusercontent.com/104442990/172941918-2df929ae-9b32-4ce5-84dd-4a05c9d62fe6.png)

There are two versions of the game, classic Tic-tac-toe and Lite 3.
![](https://user-images.githubusercontent.com/104442990/172941921-c7f77803-f1f4-44c6-b734-6f76d19d29f3.png)

>Classic Tic-tac-toe game play

Players will be greeted with the game board full of numbers, which represent the number to enter on the keyboard in the terminal window.
* Note: There is no need to enter the number as 01, 00, 05, ect. Enter single digit numbers omitting the zero. The zero is added for formatting purposes only.
![](https://user-images.githubusercontent.com/104442990/172941924-eaf2e9ed-ba2f-4dca-9536-8dd2eca52c11.png)

As players chose spaces the numbers will disappear and be replaced with the mark that the player chose. Players will be prompted to choose again if the space is already taken.

![](https://user-images.githubusercontent.com/104442990/172941926-ac1917b1-d14c-47ad-8070-678e02123f81.png)

As the game progresses, players can win by placing consecutive marks across any row, down any column or across any diagonal path as illustrated below.

![](https://user-images.githubusercontent.com/104442990/172941930-5f66e2eb-26b0-4e08-8da7-d83adba55d8d.png)
* Note: The game now displays the name entered as the winner instead of the mark.

Once the game is over the program exits and in order to play again, retype the command " ruby src/main.rb" to play again.

>Lite 3 gameplay
![](https://user-images.githubusercontent.com/104442990/172941931-bb9b5db9-99a5-4a8d-85df-cb54aeb83ed0.png)

Lite 3 gameplay is similar to classic Tic-tac-toe but in this game style the game will remove a space that was previously occupied by a players mark after 3 turns. This game mode allows for a more dynamic play-through and a different way to strategize a win.

The Lite 3 counter increments by one every turn cycle, after both players take a turn.

![](https://user-images.githubusercontent.com/104442990/172941936-db3c1fa7-427e-4365-aae4-4e052bd9e9a0.png)

![](https://user-images.githubusercontent.com/104442990/172941939-ddf1524c-6b59-4687-ad68-c6efb172dc30.png)

Here we see the Lite 3 game remove an occupied space and reset the counter to zero.

![](https://user-images.githubusercontent.com/104442990/172941941-576e1a5f-6f83-4889-a9dd-17c1a45c1314.png)

Lite 3 game is won the same as classic Tic-tac-toe, row, column or diagonally. The same goes for all game board sizes.

![5X5 example win](https://user-images.githubusercontent.com/104442990/172941943-42470c15-3a03-41d2-bd21-fe0ef52a2438.png)

>Custom boards

4X4 Board has 16 spaces

![](https://user-images.githubusercontent.com/104442990/172941907-5561b08b-ed28-40f0-babc-adf46796618f.png)

5X5 board has 25 spaces

![](https://user-images.githubusercontent.com/104442990/172941909-d38a3807-ea9d-4512-abf9-57dd2cdb6bc3.png)

>Conclusion

I hope you enjoy this version of Tic-tac-toe. Thank you for checking it out!

>License

The MIT License (MIT)

Copyright (c) 2013-2018 The Open Web Application Security Project

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
