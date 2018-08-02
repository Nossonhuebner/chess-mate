require "io/console"
class InvalidPositionError < StandardError; end

KEYMAP = {
  " " => :space,
  "h" => :left,
  "j" => :down,
  "k" => :up,
  "l" => :right,
  "w" => :up,
  "a" => :left,
  "s" => :down,
  "d" => :right,
  "\t" => :tab,
  "\r" => :return,
  "\n" => :newline,
  "\e" => :escape,
  "\e[A" => :up,
  "\e[B" => :down,
  "\e[C" => :right,
  "\e[D" => :left,
  "\177" => :backspace,
  "\004" => :delete,
  "\u0003" => :ctrl_c,
}

MOVES = {
  left: [0, -1],
  right: [0, 1],
  up: [-1, 0],
  down: [1, 0]
}

class Cursor

  attr_reader :cursor_pos, :board, :selected

  def initialize(cursor_pos, board)
    @cursor_pos = cursor_pos
    @board = board
    @selected = false
  end

  def get_input
    key = KEYMAP[read_char]
    handle_key(key)
  end

  private


  def toggle_selected
    @selected = !@selected
  end

  def read_char
    STDIN.echo = false

    STDIN.raw!

    input = STDIN.getc.chr

    if input == "\e" then
      input << STDIN.read_nonblock(3) rescue nil

      input << STDIN.read_nonblock(2) rescue nil
    end

    STDIN.echo = true
    STDIN.cooked!

    return input
  end

  def toggle_selected
    @selected = !@selected
  end

  def handle_key(key)
    case key
    when :space, :return
      toggle_selected
      return cursor_pos
    when :up, :down, :right, :left
      diff = MOVES[key]
      update_pos(diff)
    when :ctrl_c
      Process.exit(0)
    end
  end

  def update_pos(diff)
    new_row = cursor_pos[0] + diff[0]
    new_col = cursor_pos[1] + diff[1]
    new_pos = [new_row, new_col]
    if valid_space?(new_pos)
      @cursor_pos = new_pos
    else
      raise InvalidPositionError.new("Position Outside Board")
    end
  end

  def valid_space?(pos)
    pos.all? {|el| el < 8 && el > -1}
  end
end
