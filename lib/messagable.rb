require_relative 'code_peg'

module Messagable
  def welcome_msg
    'Welcome! This is a game of Mastermind.'
  end

  def rules_msg
    [
      'Player is assigned to the role of Codebreaker.',
      'The computer is the Codemaker.',
      'The Codemaker will create a Master Code.',
      'The Master Code will consist of an ordered sequence of four colors.',
      'The Codebreaker will guess the Master Code with a total of 12 guesses.',
      'The Codemaker will provide feedback after each guess the Codebreaker makes.'
    ]
  end

  def prompt_codebreaker
    'Input your guess for the code.'
  end

  def valid_colors_msg
    valid_colors = CodePeg.valid_colors
    last = valid_colors.pop
    "Valid colors are #{valid_colors.join(', ')}, and #{last}."
  end

  def explain_codebreaker_format
    [
      valid_colors_msg,
      'Input code with each color separated by spaces.',
      'Do not put any punctuation inbetween colors.',
      'Ex: "red green blue white"'
    ]
  end

  def announce_round
    "Round #{@round}."
  end

  def divider
    '-------------------------------------------------------------------------'
  end
end
