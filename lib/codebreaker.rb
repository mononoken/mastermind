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

  module ComputerCodebreaker end
end
