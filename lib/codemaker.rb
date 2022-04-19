require_relative 'code_combo'
require_relative 'messagable'

module Codemaker
  module HumanCodemaker
    include Messagable

    def initialize
      super
      @master_code = nil
    end

    # Duplicates from codebreaker.rb. There must be a better way to write these DRY.
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

    def set_master_code
      puts 'Set master code.'
      @colors = gets.chomp.downcase.split
      invalid_code_length until valid_code_length?(@colors)
      invalid_colors until valid_colors?(@colors)
      @master_code = CodeCombo.new(*@colors)
    end

    def master_code
      @master_code.combo
    end
  end

  module ComputerCodemaker
    def initialize
      super
      @master_code = nil
    end

    def set_random_master_code
      master_code_colors = []
      4.times do
        random_color = CodePeg.valid_colors[rand(6)]
        master_code_colors.push(random_color)
      end

      @master_code = CodeCombo.new(*master_code_colors)
    end

    def set_master_code
      set_random_master_code
    end

    def master_code
      @master_code.combo
    end
  end
end
