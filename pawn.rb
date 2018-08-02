require_relative 'piece.rb'

class Pawn < Piece

  def symbol
    self.color == :black ? '♟' : '♙'
  end

  def at_start_row?
    if self.color == :black
       self.pos[0] == 1
    else
      self.pos[0] == 6
    end
    false
  end

  def move_dirs
    forward_steps + side_attacks
  end

  def forward_dir
    return self.color == :black ? 1 : -1
  end

  def forward_steps
    row, col = pos
    moves = []
    moves << [row + forward_dir, col] if self.board[row + forward_dir, col].color == :null
    if at_start_row? && self.board[row + forward_dir, col].color == :null && self.board[row + (forward_dir * 2), col].color == :null
      moves << [row + (forward_dir * 2), col]
    end
  end

  def side_attacks
    pot_side_attacks = []
    check_pos = forward_steps[0]
    check_row, check_col = check_pos
    if self.board[check_row, (check_col + 1)].color != self.color && self.board[check_row, (check_col + 1)].color != :null
      pot_side_attacks << [check_row, (check_col + 1)]
    end

    if self.board[check_row, (check_col - 1)].color != self.color && self.board[check_row, (check_col - 1)].color != :null
      pot_side_attacks << [check_row, (check_col - 1)]
    end
    pot_side_attacks
  end
end
