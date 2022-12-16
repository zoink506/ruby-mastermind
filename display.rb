require 'colorize'

module Display
  def player_input
    show_colors()
    puts "Please input 4 numbers between 1-6 as the code (eg. 1234)"
    player_code = gets.chomp
    player_code = player_input() if !validate_input?(player_code)
    return player_code
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
      if !is_input_valid
        return is_input_valid
      end
    end
    return is_input_valid
  end
end
