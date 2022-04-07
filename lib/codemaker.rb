require_relative 'code_combo'

module Codemaker
  module HumanCodemaker end

  module ComputerCodemaker
    attr_reader :name

    def initialize
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

    def master_code
      @master_code.combo
    end
  end
end
