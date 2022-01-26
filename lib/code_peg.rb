require_relative 'peg'

class CodePeg < Peg
  attr_reader :color

  def initialize(color)
    super if valid_colors.any?(color)
  end

  def valid_colors
    %w[red blue yellow green white black]
  end
end
