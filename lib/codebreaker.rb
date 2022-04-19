require_relative 'code_combo'
require_relative 'messagable'
require_relative 'player'
require_relative 'feedback'

module Codebreaker
  module HumanCodebreaker
    include Messagable

    def initialize
      super
      @colors = nil
      @guess_combo = nil
    end

    def valid_code_length?(code)
      code.count == 4
    end

    def invalid_code_length
      puts 'You must choose 4 colors only.'
      @colors = gets.chomp.downcase.split
    end

    def valid_colors?(colors)
      colors.all? { |color| CodePeg.valid_colors.any?(color) }
    end

    def invalid_colors
      puts 'Invalid input.'
      puts explain_codebreaker_format
      @colors = gets.chomp.downcase.split
    end

    def set_guess_combo
      @colors = gets.chomp.downcase.split
      invalid_code_length until valid_code_length?(@colors)
      invalid_colors until valid_colors?(@colors)
      @guess_combo = CodeCombo.new(*@colors)
    end

    def guess_combo
      @guess_combo.combo
    end
  end

  module ComputerCodebreaker
    def initialize
      super
      @guess_combo = nil
    end

    def guess_combo
      @guess_combo.combo
    end

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
      colors = convert_to_colors(first_move)
      @guess_combo = CodeCombo.new(*colors)
    end

    def remove_combo(combo)
      @combo_inventory.delete(combo.combo)
    end

    def random_move
      colors = @combo_inventory.sample
      @guess_combo = CodeCombo.new(*colors)
    end

    def set_guess_combo
      if @game.round == 1
        reset_combo_inventory
        starting_move
      else
        sweep_inventory(@game.round_feedback.feedback_array)
        random_move
      end
      puts guess_combo.join(' ')
      remove_combo(@guess_combo)
    end

    def simulate_feedback(inventory_array)
      codebreaker_guess = guess_combo
      correct_clr_pos = (0..3).count { |i| codebreaker_guess[i] == inventory_array[i] }
      codebreaker_guess_reduced =
        (0..3).reduce([]) do |nonmatching, i|
          nonmatching.push(codebreaker_guess[i]) if codebreaker_guess[i] != inventory_array[i]
          nonmatching
        end
      inventory_array_reduced =
        (0..3).reduce([]) do |nonmatching, i|
          nonmatching.push(inventory_array[i]) if codebreaker_guess[i] != inventory_array[i]
          nonmatching
        end
      correct_clr_only = codebreaker_guess_reduced.count do |i|
        contains_i = inventory_array_reduced.any?(i)
        if contains_i
          inventory_array_reduced.delete_at(inventory_array_reduced.index(i))
        end
        contains_i
      end
      return correct_clr_pos, correct_clr_only
    end

    def sweep_inventory(round_feedback)
      @combo_inventory = @combo_inventory.select do |inventory_array|
        simulate_feedback(inventory_array) == round_feedback
      end
    end
  end
end
