require "colorize"
require_relative "cursor.rb"
require_relative "board.rb"
require 'byebug'

class Display
  attr_reader :cursor
  def initialize(board)
    @cursor = Cursor.new([0, 0], board)
    @board = board
    @selected = nil
  end



  def render
    if cursor.selected
      @selected = cursor.selected
    elsif @selected && @board[@selected].valid_moves.include?(cursor.cursor_pos)
      @board.move_piece(@selected, cursor.cursor_pos)
    else @cursor.selected = false;
    end
    system("clear")
    curs_row, curs_col = self.cursor.cursor_pos
    @board.grid.each_with_index do |row, row_idx|
      row.each_with_index do |el, col_idx|
        if (self.cursor.selected && self.cursor.selected[0] == row_idx && self.cursor.selected[1] == col_idx)
          print " #{el.symbol} ".colorize(:background => :green)
        elsif (curs_row == row_idx && curs_col == col_idx)
          print " #{el.symbol} ".colorize(:background => :red)
        elsif (row_idx + col_idx).even?
          print " #{el.symbol} ".colorize(:background => :yellow)
        else
          print " #{el.symbol} ".colorize(:background => :blue)
        end
        print "|" if col_idx != row.length - 1
      end
      print "\n-------------------------------\n"
    end
    @cursor.get_input
    render
    return nil
  end

  def handle_move

  end

end



if __FILE__ == $PROGRAM_NAME
  b = Board.new
  d = Display.new(b)
  index = 0
  p b[4,2]
  d.render
end
