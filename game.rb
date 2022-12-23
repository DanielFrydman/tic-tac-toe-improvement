class Game
  def initialize
    @type_of_game = TypeOfGame.new
    @difficulty = Difficulty.new
    @board = Board.new
  end
end

# class Game
#   def initialize
#     @board = %w[0 1 2 3 4 5 6 7 8]
#     @computer = 'X'
#     @user = 'O'
#     @difficulty = 1
#   end

#   def start_game
#     choose_difficulty

#     choose_type_of_game

#     initialize_message
#     print_board
#     puts 'Enter [0-8]:'

#     until no_more_moves?
#       get_user_spot
#       evaluate_board unless no_more_moves?
#       print_board
#     end

#     puts 'Game over'
#   end

#   private

#   def choose_difficulty
#     puts 'Choose the difficulty of your game:'
#     puts "[1] - Easy\n[2] - Medium\n[3] - Hard"
#     difficulty = gets.chomp.to_i
#     until difficulty.is_a? Integer && (difficulty.positive? && difficulty < 4)
#       puts 'Please, choose one of the following numbers:'
#       puts "[1] - Easy\n[2] - Medium\n[3] - Hard"
#     end

#   end

#   def choose_type_of_game
#   end

#   def initialize_message
#     puts '================================================================'
#     puts "Let's go:"
#   end

#   def get_user_spot(spot = nil)
#     until spot
#       spot = gets.chomp.to_i

#       if space_not_occupied?(@board[spot])
#         @board[spot] = @user
#         next
#       end

#       puts 'Occupied space, choose another spot:'
#       spot = nil
#     end
#   end

#   def evaluate_board
#     spot = nil
#     until spot
#       return assign_spot_to_computer(@board, 4) if middle_free?

#       spot = get_best_move(@board)

#       if space_not_occupied?(@board[spot])
#         @board[spot] = @computer
#         next
#       end

#       spot = nil
#     end
#   end

#   def get_best_move(board)
#     best_move = nil
#     available_spaces = available_spaces(board)

#     available_spaces.each do |available_space|
#       available_space_integer = available_space.to_i
#       assign_spot_to_computer(board, available_space_integer)

#       if game_over?(board)
#         best_move = available_space.to_i
#         board[best_move] = available_space
#         return best_move
#       end

#       board[available_space_integer] = @user

#       if game_over?(board)
#         best_move = available_space.to_i
#         board[best_move] = available_space
#         return best_move
#       end

#       board[available_space_integer] = available_space
#     end

#     return best_move unless best_move.nil?

#     random_number = rand(0..available_spaces.count)
#     available_spaces[random_number].to_i
#   end

#   def game_over?(board)
#     board_options = [
#       [board[0], board[1], board[2]],
#       [board[3], board[4], board[5]],
#       [board[6], board[7], board[8]],
#       [board[0], board[3], board[6]],
#       [board[1], board[4], board[7]],
#       [board[2], board[5], board[8]],
#       [board[0], board[4], board[8]],
#       [board[2], board[4], board[6]]
#     ]

#     board_options.any? { |option| option.uniq.length == 1 }
#   end

#   def print_board
#     puts " #{@board[0]} | #{@board[1]} | #{@board[2]} \n===+===+===\n #{@board[3]} | #{@board[4]} | #{@board[5]} \n===+===+===\n #{@board[6]} | #{@board[7]} | #{@board[8]} \n"
#   end

#   def tie?(board)
#     board.all? { |space| space_occupied_by_user?(space) || space_occupied_by_computer?(space) }
#   end

#   def no_more_moves?
#     game_over?(@board) || tie?(@board)
#   end

#   def middle_free?
#     @board[4] == '4'
#   end

#   def assign_spot_to_computer(board, spot)
#     board[spot] = @computer
#   end

#   def space_not_occupied?(space)
#     space_not_occupied_by_user?(space) && space_not_occupied_by_computer?(space)
#   end

#   def space_occupied_by_user?(space)
#     !space_not_occupied_by_user?(space)
#   end

#   def space_occupied_by_computer?(space)
#     !space_not_occupied_by_computer?(space)
#   end

#   def space_not_occupied_by_user?(space)
#     space != 'O'
#   end

#   def space_not_occupied_by_computer?(space)
#     space != 'X'
#   end

#   def available_spaces(board)
#     board.filter_map do |space|
#       space if space_not_occupied?(space)
#     end
#   end
# end

# game = Game.new
# game.start_game
