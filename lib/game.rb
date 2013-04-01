# Game controller
require './lib/bricks'
require './lib/piece'

class Game
  attr_reader :piece_generator

  def initialize(screen, piece_generator, keyboard_adapter = nil)
    @keyboard_adapter = keyboard_adapter
    @current_piece = nil

    @over = false
    @bricks = Bricks.new

    @screen = screen
    @screen.bricks = @bricks

    @time = 0

    @piece_generator = piece_generator
  end

  def iterate
    if iterate_horizontal?
      horizontal_move
    else
      vertical_move
    end

    @time = (@time + 1) % 4
    @screen.redraw
  end

  def over?
    @over
  end

  private
  def horizontal_move
    unless keyboard_adapter.nil?
      if keyboard_adapter.left?
        @current_piece.left
      elsif keyboard_adapter.right?
        @current_piece.right
      end
    end
  end

  def vertical_move
    next_piece if @current_piece.nil?

    if @current_piece.down_possible?
      @current_piece.down
    else
      @current_piece = nil 
    end

    @bricks.remove_complete_lines
    @over = true if @bricks.hit_top?
  end

  def iterate_horizontal?
    @time != 0
  end

  def next_piece
    @current_piece = piece_generator.next
    @current_piece.bricks = @bricks
  end
end
