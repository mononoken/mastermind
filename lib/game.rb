require_relative 'codemaker'
require_relative 'codebreaker'
require_relative 'messagable'
require_relative 'feedback'

class Game
  include Messagable
  attr_reader :codemaker #delete later

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
    puts explain_codebreaker_format
    self.play_round
    until end_condition?
      self.play_round
    end
  end

  def play_round
    @round += 1
    puts announce_round
    p @codemaker.master_code #delete later
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
    if @codebreaker.guess_combo == @codemaker.master_code
      true
    else
      @codebreaker.guess_combo[0] == @codemaker.master_code[0]
      Feedback.new()
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
