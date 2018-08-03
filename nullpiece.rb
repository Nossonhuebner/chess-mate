require_relative "piece.rb"
require 'singleton'

class NullPiece
  include Singleton
  def initialize
  end

  def valid_moves
    []
  end


  def symbol
    " "
  end

  def color
    :null
  end


end
