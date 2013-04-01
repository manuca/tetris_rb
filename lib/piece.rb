# Tetrimino
class Piece 
  attr_accessor :bricks

  def initialize(type)
  end

  def position(x, y)
    @x, @y = x, y
  end
  
  # Coordinates of parts relative to center of gravity
  def parts
    [[-1, 0], [0, 0], [1, 0], [2, 0]]
  end

  def down_possible?
    # For each part of the tetrimino 
    # calculate it coordinates
    # Check neighbour below if empty
    # If all neighbours are empty
    # return true
    # else return false
    
    possible = true

    parts.each do |p|
      x = @x + p[0] 
      y = @y + p[1] - 1

      if (y == 0) || bricks.occupied?(x, y)
        possible = false 
        break
      end
    end

    possible
  end
end
