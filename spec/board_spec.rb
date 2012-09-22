require_relative 'spec_helper'

describe Board do
  describe "#initialize" do
    it "should have the pieces in the starting formation" do
      board = Board.new
      is_reset?(board).should be_true
    end
  end

  describe "#move_piece" do
    before do
      @board = Board.new
    end

   it "should move a piece" do
     source_piece = @board.get_piece(0, 1)
     source_piece.should_not be_nil
     @board.get_piece(0, 2).should be_nil
     @board.move_piece(0, 1, 0, 2)
     @board.get_piece(0, 1).should be_nil
     target_piece = @board.get_piece(0, 2)
     target_piece.should_not be_nil
     source_piece.should == target_piece
   end

   it "should move a piece, removing a piece at the target location" do
     source_piece = @board.get_piece(0, 1)
     source_piece.should_not be_nil
     @board.get_piece(0, 7).should_not be_nil
     @board.move_piece(0, 1, 0, 7) # Clearly an invalid move, but checking validity isn't in the spec
     @board.get_piece(0, 1).should be_nil
     target_piece = @board.get_piece(0, 7)
     target_piece.should_not be_nil
     source_piece.should == target_piece
   end

   it "should raise if the piece doesn't exist" do
     @board.get_piece(0, 2).should be_nil

     expect {
       @board.move_piece(0, 2, 0, 3)
     }.to raise_error
   end

   it "should raise on invalid source location" do
     expect {
       @board.move_piece(-1, -1, 0, 0)
     }.to raise_error
   end

   it "should raise on invalid target location" do
     expect {
       @board.move_piece(0, 0, -1, -1)
     }.to raise_error
   end
 end

 describe "#remove_piece" do
   before do
     @board = Board.new
   end

   it "should remove a piece" do
     @board.get_piece(0, 0).should_not be_nil
     @board.remove_piece(0, 0)
     @board.get_piece(0, 0).should be_nil
   end

   it "should raise if the piece doesn't exist" do
     @board.get_piece(4, 4).should be_nil

     expect {
       @board.remove_piece(4, 4)
     }.to raise_error
   end

   it "should raise on invalid location" do
     expect {
       @board.remove_piece(-1, -1)
     }.to raise_error
   end
 end

 describe "#reset" do
   before do
     @board = Board.new
     @board.move_piece(0, 1, 0, 2)
   end

   it "should have all the pieces in the correct location" do
     is_reset?(@board).should be_false
     @board.reset
     is_reset?(@board).should be_true
   end
 end

 describe "#get_piece" do
   before do
     @board = Board.new
   end

   it "should get the piece at a location" do
     @board.get_piece(0, 0).kind.should == :rook
   end

   it "should return nil if there is no piece at the location" do
     @board.get_piece(4, 4).should be_nil
   end

   it "should raise on an invalid location" do
     expect {
       @board.get_piece(8, 8).kind
     }.to raise_error
   end
 end

 describe "#valid_location" do
   it "should return true for valid locations" do
     for x in 0..7 do
       for y in 0..7 do
         Board.valid_location?(x, y).should == true
       end
     end
   end

   it "should return false for invalid locations" do
     Board.valid_location?(-1, 0).should == false
     Board.valid_location?(0, -1).should == false
     Board.valid_location?(8, 7).should == false
     Board.valid_location?(7, 8).should == false
   end
 end
end

def is_reset?(board)
  return false unless board.get_piece(0, 0).try(:kind) == :rook
  return false unless board.get_piece(1, 0).try(:kind) == :knight
  return false unless board.get_piece(2, 0).try(:kind) == :bishop
  return false unless board.get_piece(3, 0).try(:kind) == :queen
  return false unless board.get_piece(4, 0).try(:kind) == :king
  return false unless board.get_piece(5, 0).try(:kind) == :bishop
  return false unless board.get_piece(6, 0).try(:kind) == :knight
  return false unless board.get_piece(7, 0).try(:kind) == :rook
  return false unless board.get_piece(0, 1).try(:kind) == :pawn
  return false unless board.get_piece(1, 1).try(:kind) == :pawn
  return false unless board.get_piece(2, 1).try(:kind) == :pawn
  return false unless board.get_piece(3, 1).try(:kind) == :pawn
  return false unless board.get_piece(4, 1).try(:kind) == :pawn
  return false unless board.get_piece(5, 1).try(:kind) == :pawn
  return false unless board.get_piece(6, 1).try(:kind) == :pawn
  return false unless board.get_piece(7, 1).try(:kind) == :pawn

  return false unless board.get_piece(0, 7).try(:kind) == :rook
  return false unless board.get_piece(1, 7).try(:kind) == :knight
  return false unless board.get_piece(2, 7).try(:kind) == :bishop
  return false unless board.get_piece(3, 7).try(:kind) == :queen
  return false unless board.get_piece(4, 7).try(:kind) == :king
  return false unless board.get_piece(5, 7).try(:kind) == :bishop
  return false unless board.get_piece(6, 7).try(:kind) == :knight
  return false unless board.get_piece(7, 7).try(:kind) == :rook
  return false unless board.get_piece(0, 6).try(:kind) == :pawn
  return false unless board.get_piece(1, 6).try(:kind) == :pawn
  return false unless board.get_piece(2, 6).try(:kind) == :pawn
  return false unless board.get_piece(3, 6).try(:kind) == :pawn
  return false unless board.get_piece(4, 6).try(:kind) == :pawn
  return false unless board.get_piece(5, 6).try(:kind) == :pawn
  return false unless board.get_piece(6, 6).try(:kind) == :pawn
  return false unless board.get_piece(7, 6).try(:kind) == :pawn

  for x in 0..7
    for y in 2..5
      return false unless board.get_piece(x, y).nil?
    end
  end

  for x in 0..7
    return false unless board.get_piece(x, 0).try(:team) == :white
    return false unless board.get_piece(x, 1).try(:team) == :white
    return false unless board.get_piece(x, 7).try(:team) == :black
    return false unless board.get_piece(x, 6).try(:team) == :black
  end

  true
end

