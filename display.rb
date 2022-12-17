require 'colorize'

module Display
  def player_input()
    puts "Please input 4 numbers between 1-6 as the code (eg. 1234), or 'exit' to quit the game."
    player_code = gets.chomp
    return 'exit' if player_code == 'exit'

    if !validate_input?(player_code)
      player_code = player_input() 
    else
      return validate_input?(player_code)
    end
  end

  def show_colors
    red = "⬤".red
    yellow = "⬤".yellow
    cyan = "⬤".cyan
    green = "⬤".green
    magenta = "⬤".magenta
    blue = "⬤".blue
    puts "1: #{red} \n2: #{yellow} \n3: #{cyan} \n4: #{green} \n5: #{magenta} \n6: #{blue}"
  end

  def validate_input?(input)
    # returns true if the input is 4 numbers between 1 and 6
    # false otherwise
    arr = input.split('')
    return false if arr.length != 4
    is_input_valid = true

    arr.each do |char| 
      is_input_valid = false if char.to_i < 1 || char.to_i > 6 
      #puts "#{char} is #{is_input_valid}"
      return false if !is_input_valid
    end
    return arr.map { |char| char.to_i }
  end

  def game_over
    puts "\nGAME OVER!".green.bold
  end

  def print_selection(input_code)
    print "Codebreaker selection: "
    input_code.each do |color|
      print "⬤ ".red if color == 1
      print "⬤ ".yellow if color == 2
      print "⬤ ".cyan if color == 3
      print "⬤ ".green if color == 4
      print "⬤ ".magenta if color == 5
      print "⬤ ".blue if color == 6
    end
    print "\n"
  end

  def give_feedback(colors_correct)
    puts "Feedback: "
    colors_correct[:color_position].times { |i| print "⬤ ".light_black }
    colors_correct[:color_not_position].times { |i| print "⬤ ".white }
    puts "\n\n"
  end

  def choose_role
    puts "Do you want to be the codemaker (1), or the codebreaker? (2)"
    role = gets.chomp
    if role != "1" && role != "2"
      choose_role()
    else
      return role
    end
  end
end
