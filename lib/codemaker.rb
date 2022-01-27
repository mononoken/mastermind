require_relative 'code_combo'

class Codemaker
  def get_code_combo
    master_code = CodeCombo.new(*colors)
  end
end
