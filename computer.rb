class CodeMaker
  def initialize
    # generate a code
    @choices = { 1 => :red, 2 => :yellow, 3 => :cyan, 4 => :green, 5 => :magenta, 6 => :blue }
    @code = generate_code()
    #p @code
  end

  def generate_code # cyan, yellow, red, green, magenta, blue
    code = Array.new(4)
    code.map { |color| @choices[rand(1..6)] }
  end

  def get_code
    @code
  end

  def check_code(player_selection)

  end
end