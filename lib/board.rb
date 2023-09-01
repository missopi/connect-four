# frozen_string_literal: true

require 'colorize'

# class for creating and updating the board
class Board
  attr_accessor :board

  def initialize
    @board = Array.new(6) { Array.new(7, ' ● ') }
  end

  def display_board
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
    display_board
  end

  def available_row(column)
    row = 0
    loop do
      return row if row == 5 || board[row + 1][column] != ' ● '
    
      row += 1
    end
  end

  def red_token
    ' ● '.colorize(:color => :red)
  end

  def yellow_token
    ' ● '.colorize(:color => :yellow)
  end

  def win_horizontal(row, column, token)
  end

  def win_vertical(row, column, token)
  end

  def win_diagonal_left(row, column, token)
  end

  def win_diagonal_right(row, column, token)
  end
end


