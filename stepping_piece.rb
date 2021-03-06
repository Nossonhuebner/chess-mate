module Stepable
  def valid_moves
    dirs = self.move_dirs
    pos = self.pos
    possible_moves = []

    dirs.each do |dir|
      temp_pos = []
      temp_pos[0] = pos[0] + dir[0]
      temp_pos[1] = pos[1] + dir[1]

      if valid_pos(temp_pos)
        possible_moves << temp_pos
      end
    end
    possible_moves
  end

  def valid_pos(pos)
    return false unless on_board?(pos)
    return false if self.board[pos].color == self.color
    true
  end

  def on_board?(pos)
    pos.all? { |coord| coord < 8 && coord >= 0 }
  end

end
