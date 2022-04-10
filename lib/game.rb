require_relative 'codemaker'
require_relative 'codebreaker'
require_relative 'messagable'
require_relative 'human_player'
require_relative 'computer_player'
require_relative 'feedback'

class Game
  include Messagable
  attr_reader :player, :round, :round_feedback

  def initialize
    @codemaker = nil
    @codebreaker = nil
    @player = HumanPlayer.new
    @player.game = self
    @computerplayer = ComputerPlayer.new
    @computerplayer.game = self
    @winner = nil
    @round = 0
    @round_feedback = nil
  end

  def intro
    puts intro_msg
  end

  def assign_roles
    @player.pick_role
    @computerplayer.opposite_player_role
    if @player.role == 'codebreaker'
      @codebreaker = @player
      @codemaker = @computerplayer
    end
    if @player.role == 'codemaker'
      @codemaker = @player
      @codebreaker = @computerplayer
    end
  end

  def begin_round
    @round += 1
    puts divider
    puts announce_round
  end

  def codebreaker_turn
    @codebreaker.set_guess_combo
  end

  def turn_feedback
    @round_feedback = Feedback.new(@codebreaker.guess_combo, @codemaker.master_code)
    puts @round_feedback.return_feedback
  end

  def play_round
    begin_round
    codebreaker_turn
    turn_feedback
    if self.guess_correct?
      @winner = @codebreaker
      self.end_game
    end
    if @round >= 12
      @winner = @codemaker
      self.end_game
    end
  end

  def play_game
    @codemaker.set_master_code
    self.play_round until end_condition?
    prompt_replay_game
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
    puts "#{@winner.name} wins on round #{@round}!"
  end

  def start_game
    intro
    assign_roles
    play_game
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
