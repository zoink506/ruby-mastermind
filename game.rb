require './display.rb'
require './player.rb'
require './computer.rb'

class Game
  include Display
  def initialize
    @player = CodeBreaker.new
    @computer = CodeMaker.new
    @first_round = true
    @number_of_guesses = 0
    round()
  end

  def round()
    while @number_of_guesses < 12
      show_colors() if @first_round 
      @first_round = false
      player_code = player_input()
      break if player_code == 'exit'
      #p "player_code: #{player_code}"
      code_correct = @computer.check_code(player_code) # check if the code is correct
      give_feedback(code_correct)
      break if code_correct[:color_position] == 4

      @number_of_guesses += 1
    end

    game_over()
  end

end