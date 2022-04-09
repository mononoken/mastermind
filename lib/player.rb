require_relative 'codebreaker'
require_relative 'codemaker'

class Player
  attr_reader :role
  attr_accessor :game

  def initialize
    @game = nil
    @role = nil
  end

  def codebreaker?
    @role == 'codebreaker'
  end

  def codemaker?
    @role == 'codemaker'
  end

  def become_role
    become_codebreaker if codebreaker?
    become_codemaker if codemaker?
  end
end
