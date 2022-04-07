require_relative 'code_combo'
require_relative 'messagable'
require_relative 'player'

module Codebreaker
  include Messagable

  module HumanCodebreaker
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
      invalid_code_length unless valid_code_length?(@colors)
      invalid_colors unless valid_colors?(@colors)
      @guess_combo = CodeCombo.new(*@colors)
    end

    def guess_combo
      @guess_combo.combo
    end
  end

  module ComputerCodebreaker
    def initialize
      @combo_inventory = (1111..6666).to_a
      @combo_inventory = @combo_inventory.map { |nums| nums.to_s.split('') }
      @combo_inventory = @combo_inventory.reject { |combo_array| combo_array.any? { |i| ['0', '7', '8', '9'].include?(i) } }
      @combo_inventory = @combo_inventory.map { |combo_array| convert_to_colors(combo_array) }
      @guess_combo = nil
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
      @guess_combo = convert_to_colors(first_move)
    end

    def remove_combo(combo)
      @combo_inventory.delete(combo)
    end

    def set_guess_combo
      @guess_combo =
        if @game.round == 1
          CodeCombo.new(*starting_move)
        else
          CodeCombo.new(*random_move)
        end
      remove_combo(@guess_combo)
      sweep_inventory(@game.round_feedback.feedback_array)
    end

    def simulate_feedback(master_code)
      codebreaker_guess = @guess_combo
      correct_clr_pos = (0..3).count { |i| codebreaker_guess[i] == master_code[i] }
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
      correct_clr_only = codebreaker_guess_reduced.count do |i|
        contains_i = master_code_reduced.any?(i)
        if contains_i
          master_code_reduced.delete_at(master_code_reduced.index(i))
        end
        contains_i
      end
      return correct_clr_pos, correct_clr_only
    end

    def sweep_inventory(round_feedback)
      # If simulated feedback does not match actual feedback, remove combo.
      @combo_inventory.select { |combo_array| simulate_feedback(combo_array) == round_feedback }
    end
  end
end
