class BrickLayout
  attr_reader :size, :width, :height, :rows
  attr_accessor :current_piece

  def initialize(width = 10, height = 22)
    @width, @height = [width, height]
    @fixed_bricks = []

    @rows = []

    height.times do
      @rows << []
    end
  end

  def hit_bottom?
    current_piece.position == [0, 0]
  end

  def hit_top?
    @rows.size == height
  end

  def fix_piece
    piece_max_row =  @current_piece.y + @current_piece.height 
    bricks_above  = piece_max_row - @fixed_bricks.height

    if bricks_above > 0
      bricks_above.times do 
        @fixed_bricks << []
      end
    end
  end
end
