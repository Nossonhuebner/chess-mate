require_relative "piece.rb"
require 'singleton'

class NullPiece
  include Singleton
  def initialize
  end

  def moves
  end


  def symbol
    " "
  end

  def color
    :null
  end


end
