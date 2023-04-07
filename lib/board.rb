require relative "knight.rb"

class Board
  def new_game
    puts "Where is the knight starting? x, y then press enter"
    start = get.chomp.to_a
    puts "Where is the knight going to? x, y then press enter"
    goal = get.chomp.to_a
    knight = Knight.new(start)
  end
end