require './game.rb'

# Repeats game indefinitely until user wants to quit
def play_game
  # ask the user whether to be the code breaker or code maker
  
  Game.new
  repeat_game()
end

def repeat_game
  puts "Would you like to play another round? (y/n)"
  input = gets.chomp()
  play_game() if input == "y"
end

play_game()
