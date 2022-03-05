require_relative 'codemaker'
require_relative 'codebreaker'
require_relative 'messagable'

class Game
  include Messagable
  attr_reader :codemaker

  def initialize
    @codemaker = Codemaker.new
    @codebreaker = Codebreaker.new
    @winner = nil
    @round = 0
  end

  def play_game
    puts welcome_msg
    puts rules_msg
    @codemaker.set_random_master_code
    self.play_round
    until end_condition?
      self.play_round
    end
  end

  def play_round
    @round += 1
    p @codemaker.master_code #delete later
    puts explain_codebreaker_format
    @codebreaker.set_guess_combo
    if self.guess_correct?
      @winner = @codebreaker
      self.end_game
    end
    if @round >= 12
      @winner = @codemaker
      self.end_game
    end
  end

  def guess_correct?
    @codebreaker.guess_combo == @codemaker.master_code
  end

  def end_condition?
    !@winner.nil? || @round >= 12
  end

  def end_game
    puts "#{@winner.name} wins!"
  end
end

new_game = Game.new
new_game.play_game
