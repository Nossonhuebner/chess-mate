class Piece
  attr_accessor :pos
  attr_reader :board, :color
  def initialize(color = :null, board = nil, pos = nil)
    @color, @board, @pos = color, board, pos
  end

  def to_s
  end

  def empty?
  end

  def symbol
  end

  def move_into_check(end_pos)
    temp_arr = self.board.dup
    temp_board = Board.new(temp_arr)
    temp_board.move_piece!(self.pos, end_pos)
    temp_board.in_check?(self.color)
  end
end
