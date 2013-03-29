# Game controller
class Game
  def initialize(screen)
    @current_piece = nil
    @over = false
    @brick_layout = BrickLayout.new
    @screen = screen
    @screen.layout = @brick_layout
  end

  def play
    iterate while !over?
  end

  def iterate
    next_piece if @current_piece.nil?

    if @brick_layout.hit_bottom?(@current_piece)
      @brick_layout.fix_piece(@current_piece)
      @current_piece = nil
    else
      @current_piece.advance_down
      @brick_layout.current_piece(@current_piece)
      @over = true if @brick_layout.hit_top?
    end

    @screen.redraw
  end

  def over?
    @over
  end

  def next_piece
    @current_piece = Piece.next
    @current_piece.brick_layout = @brick_layout
  end
end
