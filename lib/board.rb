# frozen_string_literal: true

require 'colorize'

# class for creating and updating the board
class Board
  attr_accessor :board

  def initialize
    @board = Array.new(6, ' ● ') { Array.new(7, ' ● ') }
  end

  def display_board(board)
    puts "\n"
    board.each do |row|
      row.each do |cell|
        print cell
      end
      puts
    end
    puts "\n"
    puts ' 1  2  3  4  5  6  7 '
  end

  def update_board(row, column, token)
    board[row][column] = token
    display_board(board)
  end

  def red_token
    ' ● '.colorize(:color => :red)
  end

  def yellow_token
    ' ● '.colorize(:color => :yellow)
  end
end

board = Board.new
board.update_board(5, 3, board.red_token)

