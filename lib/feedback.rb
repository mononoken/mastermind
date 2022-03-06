class Feedback
  attr_reader :correct_col_pos

  def initialize(codebreaker_guess, master_code)
    @codebreaker_guess = codebreaker_guess
    @master_code = master_code
    @correct_col_pos = (0..3).count { |i| codebreaker_guess[i] == master_code[i] }
    @correct_col_only = 0
    
  end

  def return_feedback
    [
      "Correct color and position: #{@correct_col_pos}",
      "Correct color and wrong position: #{@correct_col_only}"
    ]
  end
end
