require_relative 'code_combo'

class Game
  def initialize
    @codemaker = ComputerPlayer.new
    @codebreaker = Player.new
  end
end
