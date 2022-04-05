require_relative 'codebreaker'
require_relative 'codemaker'
require_relative 'colors'

class ComputerPlayer
  include Colors

  def initialize
    @name = 'Computer'
    @role = nil
    @combo_inventory = (1111..6666).to_a.reject { |i| i.to_s.include?('0') }
  end

  # Codebreaker methods
  def reset_combo_inventory
    @combo_inventory = (1111..6666).to_a.reject { |i| i.to_s.include?('0') }
  end

  # Choose two random colors and play them in doubles.
  def first_move
    first_move = []
    first_move.push(rand(1..6))
    first_move.push(first_move.last)
    first_move.push(rand(1..6))
    first_move.push(first_move.last)
  end

  def starting_move
    convert_to_colors(first_move)
  end

  def clear_inventory
    nil
  end
end
