require 'spec_helper'
require_relative '../lib/tetrimino'
require_relative '../lib/bricks'

describe Tetrimino do
  let(:bricks) { Bricks.new(10, 22) }
  let(:tetrimino) { Tetrimino.new(:i, bricks) }

  it { tetrimino.position.should eq([4, 21])}

  describe "#down_possible?" do
    it "returns true when movement possible" do
      tetrimino.position = [4, 21]
      tetrimino.down_possible?.should be_true
    end

    it "returns false when movement not possible" do
      tetrimino.position = [0, 1]
      tetrimino.down_possible?.should be_false
    end
  end

  describe "#down!" do
    it "changes coordinate of tetrimino" do
      tetrimino.down!
      tetrimino.position.should eq( [4, 20] )
    end

    it "draws tetrimino on new position" do
      tetrimino.down!
      bricks.row(20).should eq( [0,0,0,1,1,1,1,0,0,0] )
    end
  end

  describe "#left" do
    it "moves tetrimino left" do
      tetrimino.left
      tetrimino.position.should eq([3, 21])
    end

    it "draws tetrimino on new position" do
      tetrimino.left
      bricks.row(21).should eq( [0,0,1,1,1,1,0,0,0,0] )
    end
  end
end
