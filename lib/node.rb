class Node
  attr_reader :space, :parent
  attr_accessor :children
  def initialize(space, parent = nil, children = [])
    @space = space
    @parent = parent
    @children = children
  end
end