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

  def explain_codebreaker_format
    [
      'Input code with each color separated by spaces.',
      'Do not put any punctuation inbetween colors.',
      'Ex: "red green blue black"'
    ]
  end

  def announce_round
    "Round #{@round}."
  end
g
  def divider
    '-------------------------------------------------------------------------'
  end
end
