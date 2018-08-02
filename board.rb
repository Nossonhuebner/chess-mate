require 'byebug'
require_relative "piece.rb"
require_relative "display.rb"
require_relative "rook.rb"
require_relative "bishop.rb"
require_relative "king.rb"
require_relative "knight.rb"
require_relative "nullpiece.rb"
require_relative "pawn.rb"
require_relative "queen.rb"

class NoPieceError < StandardError ; end
class CannotMoveError < StandardError ; end

class Board
  attr_accessor :grid

  def initialize
    @grid = []
    populate_board
  end

  def move_piece(start_pos, end_pos)
    debugger
    unless valid_pos?(start_pos) && valid_pos?(end_pos)
      raise "Invalid move"
    end
    self[end_pos] = self[start_pos]
    self[start_pos] = NullPiece.instance
  end

  def [](pos)
    debugger
    row, col = pos
    grid[row][col]
  end

  def []=(pos, arg)
    row, col = pos
    grid[row][col] = arg
  end

  def valid_pos?(pos)
    pos.all? {|el| el < 8 && el > -1}
  end

  private

  def populate_board
    populate_black
    populate_empty_space
    populate_white
  end



  def populate_black
    @grid[0] = [
      Rook.new(:black, self, [0,0]), Knight.new(:black, self, [0,1]),
      Bishop.new(:black, self, [0,2]), Queen.new(:black, self, [0,3]),
      King.new(:black, self, [0,4]), Bishop.new(:black, self, [0,5]),
      Knight.new(:black, self, [0,6]), Rook.new(:black, self, [0,7])
    ]

    i = 0
    arr = []
    while i < 8
      arr << Pawn.new(:black, self, [1, i])
      i += 1
    end
    @grid[1] = arr
  end

  def populate_empty_space
    (2..5).each do |idx|
      @grid[idx] = Array.new(8, NullPiece.instance)
    end
  end

  def populate_white
    i = 0
    arr = []
    while i < 8
      arr << Pawn.new(:white, self, [6, i])
      i += 1
    end
    @grid[6] = arr

    @grid[7] = [
      Rook.new(:white, self, [7,0]), Knight.new(:white, self, [7,1]),
      Bishop.new(:white, self, [7,2]), Queen.new(:white, self, [7,3]),
      King.new(:white, self, [7,4]), Bishop.new(:white, self, [7,5]),
      Knight.new(:white, self, [7,6]), Rook.new(:white, self, [7,7])
    ]
  end

  def move_piece!(color, start_pos, end_pos)
    if start_pos == nil
      raise NoPieceError.new("No Piece Selected")
    elsif !valid_space?(end_pos)
      raise CannotMoveError.new ("Invalid End Position")
    end
    self[start_pos].position = end_pos
    self[start_pos], self[end_pos] = self[end_pos], self[start_pos]
  end

  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def []=(pos, arg)
    row, col = pos
    @grid[row][col] = arg
  end

  def checkmate?(color)
  end

  def in_check?(color)
    king_pos = find_king(color)
    enemy_color = other_color(color)


  end

  def find_king(color)
    self.grid.each_with_index do |row, row_idx|
      row.each_with_index do |col, col_idx|
        return [row_idx, col_idx] if col.is_a?(King) && col.color? == color
      end
    end
  end

  def pieces
  end

  def dup
    new_array = []
    self.each do |el|
      new_array << (el.is_a?(Array) ? el.deep_dup : el)
    end
    new_array
  end

  def other_color(color)
    if :black
       :white
    else
     :black
    end
  end

end
