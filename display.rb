require "colorize"
require_relative "cursor.rb"
require_relative "board.rb"
require 'byebug'

class Display
  attr_reader :cursor
  def initialize(board)
    @cursor = Cursor.new([0, 0], board)
    @board = board
  end

  def render
    curs_row, curs_col = self.cursor.cursor_pos
    @board.grid.each_with_index do |row, row_idx|
      row.each_with_index do |el, col_idx|
        if (curs_row == row_idx && curs_col == col_idx)
          print " X ".colorize(:background => :red)
        else
          print " X "
        end
        print "|" if col_idx != row.length - 1
      end
      print "\n-------------------------------\n"
    end
    return nil
  end

end
