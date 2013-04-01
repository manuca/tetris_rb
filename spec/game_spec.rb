require 'spec_helper'
require_relative '../lib/game'
require_relative '../lib/bricks'

class MockScreen
  attr_accessor :bricks
  def redraw; true end
end

class MockTetriminoGenerator
  def self.next
    Tetrimino.new(:i, Bricks.new(10, 22))
  end
end

describe Game do
  let(:screen)    { MockScreen.new }
  let(:generator) { MockTetriminoGenerator }
  let(:game)      { Game.new(screen, generator) }

  it "Starts with I tetrimino at the top" do
    game.iterate
    screen.bricks.row(20).should eq( [0,0,0,1,1,1,1,0,0,0] )
  end

  it "Moves tetrimino to the left" do
    keyboard = double("KeyboardAdapter", left?: true)
    game =  Game.new(screen, generator, keyboard)
    game.iterate
    screen.bricks.row(20).should eq( [0,0,0,1,1,1,1,0,0,0] )
    game.iterate
    screen.bricks.row(20).should eq( [0,0,1,1,1,1,0,0,0,0] )
  end
end
