require_relative 'user.rb'
require_relative 'computer.rb'

class Players
  def initialize
    @user = User
    @computer = Computer
    @player_one = nil
    @player_two = nil
  end

  def create_players(game_type)
    return create_player_versus_player if game_type.player_versus_player?
    return create_player_versus_computer if game_type.player_versus_computer?

    create_computer_versus_computer
  end

  def first
    @player_one
  end

  def second
    @player_two
  end

  def get_first_player_spot(board:, game_type:)
    first_player_turn_message(game_type)
    first.get_spot(board)
  end

  def get_second_player_spot(board:, game_type:)
    second_player_turn_message(game_type)
    second.get_spot(board)
  end

  def set_diffuculty(diffuculty:, game_type:)
    first.set_diffuculty(diffuculty) if game_type.computer_versus_computer?
    second.set_diffuculty(diffuculty)
  end

  private

  def first_player_turn_message(game_type)
    return puts 'First Player Turn:' if game_type.player_versus_player?
    return puts "Player's Turn:" if game_type.player_versus_computer?

    puts "First Computer's Turn:"
  end

  def second_player_turn_message(game_type)
    return puts 'Second Player Turn:' if game_type.player_versus_player?
    return puts "Computer's Turn:" if game_type.player_versus_computer?

    puts "Second Computer's Turn:"
  end

  def create_player_versus_player
    @player_one = @user.new('O')
    @player_two = @user.new('X')
  end

  def create_player_versus_computer
    @player_one = @user.new('O')
    @player_two = @computer.new('X')
  end

  def create_computer_versus_computer
    @player_one = @computer.new('O')
    @player_two = @computer.new('X')
  end
end