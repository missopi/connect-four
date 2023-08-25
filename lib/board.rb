# frozen_string_literal: true

require 'colorize'

class Board
  attr_accessor :board

  def initialize
    @board = Array.new(6) { Array.new(7) }
  end

  def update_board(row, column, token)
    board[row][column] = token
  end

  def red_token
    ' ● '.colorize(:color => :red)
  end

  def yellow_token
    ' ● '.colorize(:color => :yellow)
  end
end
