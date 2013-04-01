require 'spec_helper'
require_relative '../lib/bricks'

describe Bricks do
  describe "#row" do
    it "returns default empty row" do
      b = Bricks.new(10, 22)
      b.row(21).should eq( [ 0,0,0,0,0,0,0,0,0,0 ] )
    end
  end

  describe "#add" do
    it "adds brick" do
      b = Bricks.new(10, 22)
      b.add(0,0)
      b.row(0).should eq( [ 1,0,0,0,0,0,0,0,0,0 ] )
    end
  end

  describe "#remove" do
    it "removes brick" do
      b = Bricks.new(10, 22)
      b.add(0, 0)
      b.add(1, 0)
      b.row(0).should eq( [ 1,1,0,0,0,0,0,0,0,0 ] )
      b.remove(1,0)
      b.row(0).should eq( [ 1,0,0,0,0,0,0,0,0,0 ] )
    end
  end
end
