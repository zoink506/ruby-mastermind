require './display.rb'
require './player.rb'
require './computer.rb'

class Game
  include Display
  def initialize
    @player = Player.new
    @computer = Computer.new
    round()
  end

  def round()
    player_code = player_input()
    p "player_code: #{player_code}"
  end

end