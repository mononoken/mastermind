require_relative 'codemaker'
require_relative 'codebreaker'
require_relative 'messagable'
require_relative 'player'
require_relative 'feedback'

class Game
  include Messagable

  def initialize
    @player = Player.new
    @codemaker = nil
    @codebreaker = nil
    @winner = nil
    @round = 0
  end

  def intro
    puts divider
    puts welcome_msg
    puts divider
    puts rules_msg
    puts divider
    puts explain_codebreaker_format
  end

  def player_pick_role
    @player.pick_role
    if @player.role == 'codebreaker'
      @codebreaker = Codebreaker::HumanCodebreaker.new
      @codemaker = Codemaker::ComputerCodemaker.new
    #else opposite
    end
  end

  def start_game
    intro
    player_pick_role
    play_game
  end

  def play_game
    @codemaker.set_random_master_code
    self.play_round
    self.play_round until end_condition?
    prompt_replay_game
  end

  def begin_round
    @round += 1
    puts divider
    puts announce_round
  end

  def codebreaker_turn
    @codebreaker.set_guess_combo
    round_feedback = Feedback.new(@codebreaker.guess_combo, @codemaker.master_code)
    puts round_feedback.return_feedback
  end

  def play_round
    begin_round
    codebreaker_turn
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

  def winner?
    !@winner.nil?
  end

  def final_round?
    @round >= 12
  end

  def end_condition?
    winner? || final_round?
  end

  def end_game
    puts "Master code was #{@codemaker.master_code.join(' ')}."
    puts "#{@winner.name} wins!"
  end

  def reset_game
    @winner = nil
    @round = 0
  end

  def replay_game
    reset_game
    play_game
  end

  def prompt_replay_game
    puts 'Play again? (y/n)'
    case gets.chomp.downcase
    when 'y'
      replay_game
    when 'n'
      puts 'Thank you for playing!'
    else
      puts "Invalid input. Please type 'y' or 'n'."
      prompt_replay_game
    end
  end
end

new_game = Game.new
new_game.start_game
