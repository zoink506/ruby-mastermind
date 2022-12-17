require './display.rb'
require './player.rb'
require './computer.rb'

class Game
  include Display
  def initialize
    @first_round = true
    @number_of_guesses = 0
    role = choose_role()
    round(role)
  end

  private
  def round(role)
    
    if(role == "2")
      @code_maker = CodeMaker.new
      secret_code = @code_maker.generate_code()
      @code_maker.set_code(secret_code)
      while @number_of_guesses < 12
        show_colors() if @first_round 
        @first_round = false
        player_code = player_input()
        break if player_code == 'exit'
        print_selection(player_code)
        #p "player_code: #{player_code}"
        code_correct = @code_maker.check_code(player_code) # checks the code is correct
        give_feedback(code_correct)
        break if code_correct[:color_position] == 4

        @number_of_guesses += 1
      end
    else
      secret_code = player_input()
      p secret_code
      while @number_of_guesses < 12
        @code_maker = CodeMaker.new
        @code_maker.set_code(secret_code)
        computer_code = @code_maker.generate_code()
        print_selection(computer_code)
        code_correct = @code_maker.check_code(computer_code)
        #p code_correct
        give_feedback(code_correct)
        #break if code_correct[:color_position] == 4
        @number_of_guesses += 1
        break if code_correct[:color_position] == 4
        sleep(2)
      end
      

    end

    game_over()
  end

end