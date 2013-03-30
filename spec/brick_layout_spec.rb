require 'spec_helper'
require_relative '../lib/brick_layout'

describe BrickLayout do
  let(:layout) { BrickLayout.new }
  let(:piece) do
    p = double("piece")
    p.stub(:footprint) { [1, 1, 1, 1] }
    p
  end

  it { layout.empty?.should be_true }
  it { layout.size.should eq([10, 22]) }

  describe "#hit_bottom?" do
    it "returns true" do
      piece.stub(:position) { [0, 0] }
      layout.hit_bottom?(piece).should eq(true)
    end
  end

  describe "#bricks" do
    context "without bricks" do
      it "defaults to empty layout" do
        layout.bricks.should eq( [[]] )
      end
    end

    context "with fixed piece" do
      it "it is not empty" do
        layout.fix_piece(piece)
        layout.should_not be_empty
      end

      it "it returns bricks left by piece in layout" do
        piece.stub(:position)  { [0, 0] }
        layout.bricks.should eq( [[1, 1, 1, 1, 0, 0, 0, 0, 0, 0]] )
      end
    end
  end

  describe "#hit_top?" do
    it "returns false without bricks" do
      layout.hit_top?.should be_false
    end

    it "returns false with only one row" do
      layout.fix_piece(piece)
      layout.hit_top?.should be_false
    end

    it "return true when bricks reach top" do
      layout = BrickLayout.new([10, 1])
      layout.fix_piece(piece)
      layout.hit_top?.should be_true
    end
  end
end
