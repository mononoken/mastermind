require_relative 'codebreaker'
require_relative 'codemaker'
require_relative 'colors'

class ComputerPlayer
  include Colors
  attr_reader :name, :combo_inventory
  attr_accessor :game

  def initialize
    @name = 'Computer'
    @game = nil
    @role = nil
  end

  def codebreaker?
    @role == 'codebreaker'
  end

  def codemaker?
    @role == 'codemaker'
  end

  def opposite_player_role
    case @game.player.role
    when 'codebreaker'
      @role = 'codemaker'
    when 'codemaker'
      @role = 'codebreaker'
    end
    become_codebreaker if codebreaker?
    become_codemaker if codemaker?
  end

  def become_codebreaker
    self.extend(Codebreaker::ComputerCodebreaker)
  end

  def become_codemaker
    self.extend(Codemaker::ComputerCodemaker)
  end
end
