require_relative 'peg'

class KeyPeg < Peg
  attr_reader :color

  def initialize(color)
    super if valid_colors.any?(color)
  end

  def valid_colors
    %w[white red]
  end
end
