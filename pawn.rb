require_relative 'piece.rb'

class Pawn < Piece

  def symbol
    self.color == :black ? '♟'.colorize(self.color) : '♙'.colorize(self.color)
  end

  def at_start_row?
    if self.color == :black
       return self.pos[0] == 1
    else
      return self.pos[0] == 6
    end
    false
  end

  def valid_moves
    forward_steps + side_attacks
  end

  def forward_dir
    return self.color == :black ? 1 : -1
  end

  def forward_steps
    row, col = pos
    moves = []
    moves << [row + forward_dir, col] if self.board.empty?([row + forward_dir, col])
    if at_start_row? && self.board.empty?([row + forward_dir, col]) && self.board.empty?([row + (forward_dir * 2), col])
      moves << [row + (forward_dir * 2), col]
    end
    moves
  end

  def side_attacks
    pot_side_attacks = []
    check_pos = forward_steps[0]
    return [] unless check_pos
    check_row, check_col = check_pos
    if self.board.enemy_piece?([check_row, (check_col + 1)], self.color)
      pot_side_attacks << [check_row, (check_col + 1)]
    end

    if self.board.enemy_piece?([check_row, (check_col - 1)], self.color)
      pot_side_attacks << [check_row, (check_col - 1)]
    end
    pot_side_attacks
  end
end
