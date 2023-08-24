# frozen_string_literal: true

# class for creating players 
class Player
  attr_accessor :name, :token

  def initialize(name, token)
    @name = name
    @token = token
  end
end