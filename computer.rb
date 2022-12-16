class CodeMaker
  def initialize
    # generate a code
    @choices = { 1 => :red, 2 => :yellow, 3 => :cyan, 4 => :green, 5 => :magenta, 6 => :blue }
    @code = generate_code()
    puts "computer code: #{@code}"
  end

  private
  def generate_code # cyan, yellow, red, green, magenta, blue
    code = Array.new(4)
    #code.map { rand(1..6) }
    code = [1, 1, 5, 3]
  end

  public
  def get_code
    @code
  end

  def check_code(player_selection) # DOESNT WORK: use 2131, 2431
    # returns { hash }
    # :color_position - both position and color are correct
    # :color_not_position - the color is correct but not the position
    return_hash = { color_position: 0, color_not_position: 0 }
    memory_array = [false, false, false, false]
    
    # loop through to check if the position and color are both correct first,
    # then loop through to check the color but not position
    player_selection.each_with_index do |color, index|
      if color == @code[index]
        return_hash[:color_position] += 1
        memory_array[index] = true
      end
    end

    player_selection.each_with_index do |breaker_color, breaker_index|
      @code.each_with_index do |maker_color, maker_index|
        if maker_index != breaker_index && maker_color == breaker_color && memory_array[maker_index] == false
          return_hash[:color_not_position] += 1
          memory_array[maker_index] = true
        end
      end
    end

    return return_hash
  end


end