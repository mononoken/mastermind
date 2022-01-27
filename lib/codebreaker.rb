require_relative 'code_combo'

class Codebreaker
  attr_reader :combo

  def initialize
    @name = 'Codebreaker'
  end

  def set_combo
    colors = gets.chomp.downcase.split
    @combo = CodeCombo.new(*colors)
  end
end
