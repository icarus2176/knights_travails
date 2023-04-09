require_relative "knight.rb"
require_relative "node.rb"

class Board
  def initialize
    puts "Where is the knight starting? xy then press enter"
    @start = gets.chomp.split("").map(&:to_i)
    puts "Where is the knight going to? xy then press enter"
    @goal = gets.chomp.split("").map(&:to_i)
    @knight = Knight.new(@start)
    @root = Node.new(@start)
    create_tree(@root)
    depths = find_goals.map { |node| depth(node)}
    puts depths.length
    find_shortest(depths)
  end

  def create_tree(node, visited = [@root.space])
    moves = @knight.moves_available(node.space) - visited
    visited.push(node.space)
    return if moves.empty?
    
    moves.each do |move|
      child = Node.new(move, node)
      node.children.push(child)
      create_tree(child, visited) unless child.space == @goal
    end
  end

  def depth(node)
    count = 0
    current = node
    while current.parent
      current = current.parent
      count += 1
    end
    [node, count]
  end

  def find_goals(node = @root)
    answer = []

    answer.push(node) if node.space == @goal
    if node.children
      node.children.each do |child|
        answer.push(find_goals(child))
      end
      answer&.flatten.uniq
    end
  end

  def find_shortest(arr)
    shortest = nil
    arr.each do |route|
      if shortest == nil || route[1] < shortest[1]
        shortest = route
      end
    end
    complete(shortest)
  end

  def complete(route)
    puts "You made it in #{route[1]} moves! Here's your path:"
    display_parents(route[0])
  end

  def display_parents(node)
    display_parents(node.parent) if node.parent
    puts "[#{node.space}]"
  end

  def visited(node)
    visit_list = [node.space]
    current = node
    while current.parent
      current = current.parent
      visit_list.push(current.space)
    end
    visit_list
  end
end