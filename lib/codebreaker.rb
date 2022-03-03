require_relative 'code_combo'

class Codebreaker
  def initialize
    @name = 'Codebreaker'
    @guess_combo = nil
  end

  def set_combo
    colors = gets.chomp.downcase.split
    @guess_combo = CodeCombo.new(*colors)
  end

  def guess_combo
    @guess_combo.combo
  end
end
