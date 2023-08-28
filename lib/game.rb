# frozen_string_literal: true

require_relative '../lib/board'
require_relative '../lib/player'
require 'colorize'

# class for the gameplay
class Game
  attr_accessor :board, :name, :token

  def initialize
    @board = Board.new
    @token = [board.red_token, board.yellow_token]
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

  def play
  end

  def player_turn
  end

  def player_input(player)
    puts "\n#{player.name} choose a column from 1 - 7 to drop your token"
    player_input = gets.chomp.to_i - 1
  end

  def valid_move?(player_input)
    return true if player_input.between?(0, 6)
  end

  def game_over?
  end

  def win
  end

  def draw
  end

  def final_message
  end
end