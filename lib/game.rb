require_relative 'codemaker'
require_relative 'codebreaker'

class Game
  attr_reader :codemaker

  def initialize
    @codemaker = Codemaker.new
    @codebreaker = Codebreaker.new
  end

  def start_game
    @codemaker.set_random_master_code
  end
end

new_game = Game.new
new_game.start_game
p new_game.codemaker.master_code.combo
