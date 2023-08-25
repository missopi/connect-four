# frozen_string_literal: true

require_relative '../lib/board'
require_relative '../lib/player'
require 'colorize'

# class for the gameplay
class Game
  def initialize
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

  def play
  end

  def player_turn
  end

  def player_input
  end

  def valid_move
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