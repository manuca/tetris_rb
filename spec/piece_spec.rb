require 'spec_helper'
require_relative '../lib/piece'
require_relative '../lib/bricks'

describe Piece do
  describe "#down_possible?" do
    let(:bricks) do
      Bricks.new(10, 2)
    end
    let(:piece) do
      p = Piece.new(:i)
      p.bricks = bricks
      p
    end

    it "returns true when movement possible" do
      piece.position(0, 0)
      piece.down_possible?.should be_true
    end

    it "returns false when movement not possible" do
      piece.position(0, 1)
      piece.down_possible?.should be_false
    end
  end
end
