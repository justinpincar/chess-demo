class Board
  def initialize
    reset
  end

  def get_piece(x, y)
    unless Board.valid_location?(x, y)
      raise "Invalid location (#{x}, #{y})"
    end

    @pieces[[x,y]]
  end

  def move_piece(source_x, source_y, target_x, target_y)
    unless Board.valid_location?(source_x, source_y) and Board.valid_location?(target_x, target_y)
      raise "Invalid location (#{x}, #{y})"
    end

    piece = @pieces.delete([source_x, source_y])
    if piece.nil?
      raise "No piece at location (#{source_x}, #{source_y})"
    end

    @pieces[[target_x, target_y]] = piece
  end

  def remove_piece(x, y)
    unless Board.valid_location?(x, y)
      raise "Invalid location (#{x}, #{y})"
    end

    piece = @pieces.delete([x, y])
    if piece.nil?
      raise "No piece at location (#{x}, #{y})"
    end
  end

  def reset
    @pieces = {
      [0, 0] => Piece::Rook.new(:white),
      [1, 0] => Piece::Knight.new(:white),
      [2, 0] => Piece::Bishop.new(:white),
      [3, 0] => Piece::Queen.new(:white),
      [4, 0] => Piece::King.new(:white),
      [5, 0] => Piece::Bishop.new(:white),
      [6, 0] => Piece::Knight.new(:white),
      [7, 0] => Piece::Rook.new(:white),
      [0, 1] => Piece::Pawn.new(:white),
      [1, 1] => Piece::Pawn.new(:white),
      [2, 1] => Piece::Pawn.new(:white),
      [3, 1] => Piece::Pawn.new(:white),
      [4, 1] => Piece::Pawn.new(:white),
      [5, 1] => Piece::Pawn.new(:white),
      [6, 1] => Piece::Pawn.new(:white),
      [7, 1] => Piece::Pawn.new(:white),

      [0, 7] => Piece::Rook.new(:black),
      [1, 7] => Piece::Knight.new(:black),
      [2, 7] => Piece::Bishop.new(:black),
      [3, 7] => Piece::Queen.new(:black),
      [4, 7] => Piece::King.new(:black),
      [5, 7] => Piece::Bishop.new(:black),
      [6, 7] => Piece::Knight.new(:black),
      [7, 7] => Piece::Rook.new(:black),
      [0, 6] => Piece::Pawn.new(:black),
      [1, 6] => Piece::Pawn.new(:black),
      [2, 6] => Piece::Pawn.new(:black),
      [3, 6] => Piece::Pawn.new(:black),
      [4, 6] => Piece::Pawn.new(:black),
      [5, 6] => Piece::Pawn.new(:black),
      [6, 6] => Piece::Pawn.new(:black),
      [7, 6] => Piece::Pawn.new(:black),
    }
  end

  def self.valid_location?(x, y)
    (x < 0 or x > 7 or y < 0 or y > 7) ? false : true
  end
end

