require 'spec_helper'
require_relative '../lib/game'

class MockScreen
  attr_accessor :bricks
  def refresh; true end
end

class MockPieceGenerator
  def self.next
    Piece.new(:i)
  end
end

describe Game do
  let(:screen)    { MockScreen.new }
  let(:generator) { MockPieceGenerator }
  let(:game)      { Game.new(screen, generator) }

  it "Starts with piece at the top" do
    game.iterate
    screen.bricks.slice(0, 10).should eq( [0,0,0,1,1,1,1,0,0,0] )
  end
end
