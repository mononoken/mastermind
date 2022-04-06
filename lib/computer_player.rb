require_relative 'codebreaker'
require_relative 'codemaker'
require_relative 'colors'

class ComputerPlayer
  include Colors
  attr_reader :combo_inventory

  def initialize
    @name = 'Computer'
    @role = nil
    @combo_inventory = (1111..6666).to_a
    @combo_inventory = @combo_inventory.map { |nums| nums.to_s.split('') }
    @combo_inventory = @combo_inventory.reject { |combo_array| combo_array.any? { |i| ['0', '7', '8', '9'].include?(i) } }
    @combo_inventory = @combo_inventory.map { |combo_array| convert_to_colors(combo_array) }
  end

  # Codebreaker methods
  def reset_combo_inventory
    @combo_inventory = (1111..6666).to_a
    @combo_inventory = @combo_inventory.map { |nums| nums.to_s.split('') }
    @combo_inventory = @combo_inventory.reject { |combo_array| combo_array.any? { |i| ['0', '7', '8', '9'].include?(i) } }
    @combo_inventory = @combo_inventory.map { |combo_array| convert_to_colors(combo_array) }
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

  def remove_combo(combo)
    @combo_inventory.delete(combo)
  end

  def clear_inventory
    nil
  end
end

test = ComputerPlayer.new
p test.combo_inventory
