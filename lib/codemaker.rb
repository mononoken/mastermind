require_relative 'code_combo'

module Codemaker
  class HumanCodemaker end

  class ComputerCodemaker
    attr_reader :name

    def initialize
      @role = 'codemaker'
      @name = 'Codemaker'
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
