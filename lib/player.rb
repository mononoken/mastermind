class Player
  attr_reader :name, :role

  def initialize
    @name = 'Player'
  end

  def pick_role
    puts "Please pick the role of 'codebreaker' or codemaker'."
    @role = gets.chomp.downcase
    until @role == 'codebreaker' || @role == 'codemaker'
      puts "Invalid role. Please pick 'codebreaker' or 'codemaker'"
      @role = gets.chomp.downcase
    end
  end
end
