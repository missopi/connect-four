# frozen_string_literal: true

require_relative '../lib/board'
require_relative '../lib/player'
require 'colorize'

# class for the gameplay
class Game
  attr_accessor :board, :name, :token

  def initialize(turn = 0)
    @board = Board.new
    @token = [board.red_token, board.yellow_token]
    @turn = turn
  end

  def instructions
    puts "\n"
    puts '-------- Connect Four ---------'
    puts "\n"
    puts 'Take turns choosing a column on the'
    puts 'board to drop your coloured token. The'
    puts 'first person to get four in a row wins.'
    puts "\n"
  end

  def create_player(number)
    puts "\nPlayer #{number}, enter your name:"
    name = gets.chomp.capitalize!
    player_token = token[number - 1]
    Player.new(name, player_token)
  end

  def assign_current_player(turn)
    turn.odd? ? @player_one : @player_two
  end

  def play
    instructions
    @board.display_board
    @player_one = create_player(1)
    @player_two = create_player(2)
    loop do
      @turn += 1
      current_player = assign_current_player(@turn)
      player_turn(current_player)
      break if game_over?(current_player) == true || board_full(@turn) == true
    end
  end

  def player_turn(player)
    input = player_input(player)
    if valid_move?(input) && space_available?(input)
      @board.update_board(@board.available_row(input), input, player.token)
    elsif valid_move?(input)
      puts 'That column is full, please choose another'
      player_turn(player)
    end
  end

  def player_input(current_player)
    puts "\n#{current_player.name} choose a column from 1 - 7 to drop your token"
    gets.to_i - 1
  end

  def valid_move?(player_input)
    return true if player_input.between?(0, 6)
  end

  def space_available?(player_input)
    return true if @board.board[0][player_input] == ' ● '
  end

  def board_full(turn)
    return unless turn == 42

    puts "\nThe board is full, it's a draw!"
    true
  end

  def game_over?(player)
    6.times do |row|
      7.times do |column|
        if @board.win(row, column, player.token)
          puts "\nCongratulations #{player.name}, you won!!"
          return true
        end
      end
    end
  end
end

game = Game.new
game.play
