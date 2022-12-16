require './display.rb'
require './player.rb'
require './computer.rb'

class Game
  include Display
  def initialize
    @player = CodeBreaker.new
    @computer = CodeMaker.new
    @first_round = true
    round()
  end

  def round()
    show_colors() if @first_round 
    @first_round = false
    player_code = player_input()
    p "player_code: #{player_code}"
    # check if the code is correct
    code_correct = @computer.check_code(player_code)
    p code_correct
  end

end