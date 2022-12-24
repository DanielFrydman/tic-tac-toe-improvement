require_relative 'game_type.rb'
require_relative 'players.rb'
require_relative 'difficulty.rb'
require_relative 'board.rb'

class Game
  def initialize
    @game_type = GameType.new
    @players = Players.new
    @difficulty = Difficulty.new
    @board = Board.new
  end

  def start_game
    @game_type.ask_for_game_type

    @players.create_players(@game_type)

    unless @game_type.player_versus_player?
      @difficulty.ask_for_game_difficulty
      @players.set_diffuculty(diffuculty: @difficulty, game_type: @game_type)
    end

    puts "Let's go!"
    @board.print

    until @board.game_over?
      unless @board.game_over?
        @players.get_first_player_spot(board: @board, game_type: @game_type)
        @board.print
      end

      unless @board.game_over?
        @players.get_second_player_spot(board: @board, game_type: @game_type)
        @board.print
      end
    end

    puts 'Game over!'
  end
end

game = Game.new
game.start_game
