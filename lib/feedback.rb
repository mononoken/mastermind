class Feedback
  attr_reader :correct_clr_pos, :correct_clr_only

  def initialize(codebreaker_guess, master_code)
    @codebreaker_guess = codebreaker_guess
    @master_code = master_code
    @correct_clr_pos = (0..3).count { |i| codebreaker_guess[i] == master_code[i] }
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
    @correct_clr_only = codebreaker_guess_reduced.count do |i|
      contains_i = master_code_reduced.any?(i)
      if contains_i
        master_code_reduced.delete_at(master_code_reduced.index(i))
      end
      contains_i
    end
  end

  def return_feedback
    [
      "Correct color and position: #{@correct_clr_pos}",
      "Correct color and wrong position: #{@correct_clr_only}"
    ]
  end
end
