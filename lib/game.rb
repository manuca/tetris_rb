class Game
  def initialize
    @current_piece = nil
    @over = false
    @brick_layout = BrickLayout.new
  end

  def over?
    @over
  end

  def play
    iterate while !over?
  end

  def next_piece
    @current_piece = Piece.next
    @current_piece.brick_layout = @brick_layout
  end

  def iterate
    next_piece if @current_piece.nil?

    if @current_piece.hit_bottom?
      @brick_layout.fix_piece(@current_piece)
      @current_piece = nil
    else
      @current_piece.advance_down
      @brick_layout.update(@current_piece)
      @over = true if @brick_layout.hit_top?
    end
  end
end
