require './lib/bricks'
require './lib/tetrimino'

class Game
  attr_reader :tetrimino_generator, :keyboard_adapter

  def initialize(screen, tetrimino_generator, keyboard_adapter = nil)
    @keyboard_adapter = keyboard_adapter
    @current_tetrimino = nil

    @over = false
    @bricks = Bricks.new(10, 22)

    @screen = screen
    @screen.bricks = @bricks

    @time = 0

    @tetrimino_generator = tetrimino_generator
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
        @current_tetrimino.left
      elsif keyboard_adapter.right?
        @current_tetrimino.right
      end
    end
  end

  def vertical_move
    next_tetrimino if @current_tetrimino.nil?

    if @current_tetrimino.down_possible?
      @current_tetrimino.down!
    else
      @current_tetrimino = nil 
    end

    @bricks.remove_complete_lines
    @over = true if @bricks.hit_top?
  end

  def iterate_horizontal?
    @time != 0
  end

  def next_tetrimino
    @current_tetrimino = tetrimino_generator.next
    @current_tetrimino.bricks = @bricks
  end
end
