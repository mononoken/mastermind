require_relative 'codebreaker'
require_relative 'codemaker'
require_relative 'colors'
require_relative 'player'

class ComputerPlayer < Player
  include Colors
  attr_reader :name, :combo_inventory

  def initialize
    @name = 'Computer'
    super
  end

  def become_codebreaker
    self.extend(Codebreaker::ComputerCodebreaker)
  end

  def become_codemaker
    self.extend(Codemaker::ComputerCodemaker)
  end

  def opposite_player_role
    case @game.player.role
    when 'codebreaker'
      @role = 'codemaker'
    when 'codemaker'
      @role = 'codebreaker'
    end
    become_role
  end
end
