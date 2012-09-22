require_relative 'spec_helper'

describe Piece do
  describe "#initialize" do
    it "should build a valid object" do
      piece = Piece.new(:white)
      piece.should be_an_instance_of Piece

      piece = Piece.new(:black)
      piece.should be_an_instance_of Piece
    end

    it "should raise on an invalid team" do
      expect {
        Piece.new(:orange)
      }.to raise_error
    end
  end

  describe "#kind" do
    it "should return a valid kind for each piece" do
      kinds = [:king, :queen, :knight, :bishop, :rook, :pawn]

      [Piece::King, Piece::Queen, Piece::Knight, Piece::Bishop, Piece::Rook, Piece::Pawn].each do |klass|
        piece = klass.new(:white)
        kinds.should include(piece.kind)
      end
    end
  end

  describe "#team" do
    before do
      @piece = Piece.new(:white)
    end

    it "should return a valid team" do
      @piece.team.should == :white
    end
  end
end

