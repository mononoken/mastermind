require_relative 'code_peg'

class CodeCombo
  def initialize(color1, color2, color3, color4)
    @combo = [CodePeg.new(color1), CodePeg.new(color2), CodePeg.new(color3), CodePeg.new(color4)]
  end

  def combo
    @combo.map(&:color)
  end
end
