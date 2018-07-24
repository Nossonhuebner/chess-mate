require 'byebug'
require_relative "piece.rb"

class NoPieceError < StandardError ; end
class CannotMoveError < StandardError ; end

class Board
  attr_accessor :grid

  def initialize
    @grid = []
    populate_board
  end

  def move_piece(start_pos, end_pos)
    unless valid_start_pos?(start_pos) && valid_end_pos?(end_pos)
      raise "Invalid move"
    end
    self[end_pos] = self[start_pos]
    self[start_pos] = nil
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

  private

  def populate_board
    populate_black
    populate_empty_space
    populate_white
  end

  def populate_black
    grid[0] = Array.new(8, Piece.new)
    grid[1] = Array.new(8, Piece.new)
  end

  def populate_empty_space
    (2..5).each do |row|
      grid[row] = Array.new(8, nil)
    end
  end

  def populate_white
    grid[6] = Array.new(8, Piece.new)
    grid[7] = Array.new(8, Piece.new)
  end



  def valid_start_pos?(pos)
    self[pos] != nil
  end

  def valid_end_pos?(pos)
    self[pos] == nil
  end
end
