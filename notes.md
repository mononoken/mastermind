Initial game:
  Create both players
  Codemaker creates code
  Start first round

Round:
  Tally round
  Prompt Codebreaker for guess
  Compare guess to Master Code
  Result

Result:
  If correct
    End game with Codebreaker as winner
  If incorrect
    Return feedback

    If tally is at max guesses
      End game with Codemaker as winner
    If tally is below max guesses
      Initiate next round



I want to loop through a hash and count all instances that match the value of that index except the exact index it occurs on. Need to account for duplicates as well.

Remove all correct_col_pos from codebreaker_guess array and master_code array. 
Then loop through each item in the new codebreaker_guess array 
and check if it occurs at all in the new master_code array.

---

We need to add functionality that provides feedback for when the player inputs incorrect information.

---

