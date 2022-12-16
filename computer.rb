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
    code.map { rand(1..6) }
  end

  public
  def get_code
    @code
  end

  def check_code(player_selection)
    # returns { hash }
    # :color_position - both position and color are correct
    # :color_not_position - the color is correct but not the position
    return_hash = { color_position: 0, color_not_position: 0 }
    @code.each_with_index do |color, index|
      if color == player_selection[index]
        return_hash[:color_position] += 1
        next
      end

      player_selection.each_with_index do |color2, index2|
        return_hash[:color_not_position] += 1 if color == color2
      end

    end
    return_hash
  end
end