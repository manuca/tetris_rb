class Bricks
  def initialize(width, height)
    @width, @height = width, height
    @rows = []
    initialize_rows
  end

  def add(x, y)
    @rows[y][x] = 1
  end

  def remove(x, y)
    @rows[y][x] = 0
  end

  def occupied?(x, y)
  end

  def remove_complete_lines
  end

  def hit_top?
  end

  def row(number)
    @rows[number]
  end

  private
  def initialize_rows
    @height.times do
      @rows << [0,0,0,0,0,0,0,0,0,0]
    end
  end
end
