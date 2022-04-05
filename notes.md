Add a quit option throughout the game.

---

Each position has possible colors. As guesses go, computer play eliminiates possible colors using logic.

---

I decided I should make the randomization process for the computer player independent of the game and then add it to the game.

Codebreaker and Codemaker shall have if statements that use different methods depending on if the Codemaker type is computer or player.
- Must set a variable that tracks the type of Codemaker/Codebreaker as 'computer' or 'player'.
- For player, methods will require input but for computer the moves will auto-generate. Their separate methods will be triggered by the same method which will have an if statement depending on whether player/computer.
- Create a 'try' method where computer tries every possibility and sees if it matches the feedback provided. If it does not match, remove it from possible combos.