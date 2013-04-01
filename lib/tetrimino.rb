class Tetrimino 
  attr_accessor :bricks

  def initialize(type, bricks)
    @x, @y = 4, 21
    @bricks = bricks
    add_parts
  end

  def position=(pos)
    @x, @y = pos[0], pos[1]
  end

  def position
    [@x, @y]
  end

  # Coordinates of parts relative to center of gravity
  def parts
    [[-1, 0], [0, 0], [1, 0], [2, 0]]
  end

  def down!
    remove_parts
    @y -= 1
    add_parts
  end

  def left
    remove_parts
    @x -= 1
    add_parts
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

  private
  def add_parts
    parts.each do |p|
      x = @x + p[0] 
      y = @y + p[1]
      bricks.add(x, y)
    end
  end

  def remove_parts
    parts.each do |p|
      x = @x + p[0] 
      y = @y + p[1]
      bricks.remove(x, y)
    end
  end
end
