require_relative 'code_combo'

class Codebreaker
  attr_reader :name

  def initialize
    @name = 'Codebreaker'
    @guess_combo = nil
  end

  def set_guess_combo
    colors = gets.chomp.downcase.split
    until valid_colors?(colors)
      puts 'Invalid input.'
      colors = gets.chomp.downcase.split
    end
    @guess_combo = CodeCombo.new(*colors)
  end

  def valid_colors?(colors)
    colors.all? { |color| CodePeg.valid_colors.any?(color) }
  end

  def guess_combo
    @guess_combo.combo
  end
end
