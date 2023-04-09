class Knight
  attr_reader :starting
  @@moves = [[1, 2], [1, -2], [-1, 2], [-1, -2], [2, 1], [2, -1], [-2, 1], [-2, -1]]

  def  initialize(starting)
    @starting = starting
  end

  def moves_available(space)
    move_spaces = []
    @@moves.each do |move|
      x = move[0] + space[0]
      y = move[1] + space[1]

    move_spaces.push([x, y]) if x.between?(0, 7) && y.between?(0, 7)
    end
      move_spaces
  end
end