# require 'spec_helper'
# require_relative '../lib/brick_layout'
# 
# describe BrickLayout do
# 
#   describe "Defaults" do
#     it { BrickLayout.new.width.should eq(10) }
#     it { BrickLayout.new.height.should eq(22) }
#   end
# 
#   let(:layout) { BrickLayout.new(10, 2) }
# 
#   let(:piece) do
#     p = double("piece")
#     p.stub(:rows) { [[1, 1, 1, 1]] }
#     p.stub(:height) { 1 }
#     p
#   end
# 
#   describe "#hit_bottom?" do
#     it "returns true" do
#       piece.stub(:position) { [0, 0] }
#       layout.current_piece = piece
#       layout.hit_bottom?.should eq(true)
#     end
#   end
# 
#   describe "#rows" do
#     context "without bricks" do
#       it { layout.rows.should eq( [[], []] ) }
#     end
# 
#     context "with fixed piece" do
#       before do
#         piece.stub(:position)  { [0, 0] }
#         layout.current_piece = piece
#         layout.fix_piece
#       end
# 
#       it "it returns bricks left by piece in layout" do
#         layout.rows.should eq( [[1, 1, 1, 1, 0, 0, 0, 0, 0, 0], [] ] )
#       end
#     end
#   end
# 
#   describe "#hit_top?" do
#     it "returns false without bricks" do
#       layout.hit_top?.should be_false
#     end
# 
#     it "returns false with only one row" do
#       piece.stub(:position)  { [0, 0] }
#       layout.current_piece = piece
#       layout.fix_piece
#       layout.hit_top?.should be_false
#     end
# 
#     it "return true when bricks reach top" do
#       layout = BrickLayout.new(10, 1)
#       piece.stub(:position)  { [0, 0] }
#       layout.current_piece = piece
#       layout.fix_piece
#       layout.hit_top?.should be_true
#     end
#   end
# end
