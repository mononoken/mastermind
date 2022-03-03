require_relative 'code_combo'

class Codemaker
  attr_reader :name

  def initialize
    @name = 'Codemaker'
    @master_code = nil
  end

  def set_random_master_code
    master_code_colors = []
    4.times do
      random_color = CodePeg.valid_colors[rand(6)]
      master_code_colors.push(random_color)
    end

    @master_code = CodeCombo.new(master_code_colors[0], master_code_colors[1],
                                 master_code_colors[2], master_code_colors[3])
  end

  def master_code
    @master_code.combo
  end
end
