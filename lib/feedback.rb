class Feedback
  attr_reader :correct_col_pos, :correct_col_only

  def initialize(codebreaker_guess, master_code)
    @codebreaker_guess = codebreaker_guess
    @master_code = master_code
    @correct_col_pos = (0..3).count { |i| codebreaker_guess[i] == master_code[i] }
    codebreaker_guess_reduced =
      (0..3).reduce([]) do |nonmatching, i| 
        nonmatching.push(codebreaker_guess[i]) if codebreaker_guess[i] != master_code[i]
        nonmatching
      end
    master_code_reduced =
      (0..3).reduce([]) do |nonmatching, i| 
        nonmatching.push(master_code[i]) if codebreaker_guess[i] != master_code[i]
        nonmatching
      end
    @correct_col_only = codebreaker_guess_reduced.count{ |i| master_code_reduced.any?(i) }
  end

  def return_feedback
    [
      "Correct color and position: #{@correct_col_pos}",
      "Correct color and wrong position: #{@correct_col_only}"
    ]
  end
end
