require_relative 'codebreaker'
require_relative 'codemaker'
require_relative 'player'

class HumanPlayer < Player
  attr_reader :name

  def initialize
    @name = 'Player'
    super
  end

  def become_codebreaker
    self.extend(Codebreaker::HumanCodebreaker)
  end

  def become_codemaker
    self.extend(Codemaker::HumanCodemaker)
  end

  def pick_role
    puts "Please pick the role of 'codebreaker' or codemaker'."
    @role = gets.chomp.downcase
    until @role == 'codebreaker' || @role == 'codemaker'
      puts "Invalid role. Please pick 'codebreaker' or 'codemaker'"
      @role = gets.chomp.downcase
    end
    become_role
  end
end
