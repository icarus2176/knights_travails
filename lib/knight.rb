class Knight
  attr_accessor :starting
  moves = [[1, 2], [1, -2]. [-1, 2], [-1, -2], [2, 1], [2, -1], [-2, 1], [-2, -1]]

  def  initialize(starting)
    @starting = starting
  end

  def moves_available(location = @starting)
    move_spaces = []
    moves.each do |move|
      x = move[0] + location[0]
      y = move[1] + location[1]

      move_spaces.push([x, y]) unless x > 7 || y > 7
    end
      move_spaces
  end
end