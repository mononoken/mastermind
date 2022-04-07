require_relative 'codebreaker'
require_relative 'codemaker'

class Player
  attr_reader :name, :role
  attr_accessor :game

  def initialize
    @name = 'Player'
    @game = nil
    @role = nil
  end

  def pick_role
    puts "Please pick the role of 'codebreaker' or codemaker'."
    @role = gets.chomp.downcase
    become_codebreaker if codebreaker?
    # become_codemaker if codemaker? Combine into new method
    until @role == 'codebreaker' || @role == 'codemaker'
      puts "Invalid role. Please pick 'codebreaker' or 'codemaker'"
      @role = gets.chomp.downcase
      become_codebreaker if codebreaker?
      # become_codemaker if codemaker?
    end
  end

  def codebreaker?
    @role == 'codebreaker'
  end

  def become_codebreaker
    self.extend(Codebreaker::HumanCodebreaker)
  end
end
