require_relative 'player.rb'

class Computer < Player
  def initialize(character)
    super(character)
    @difficulty = nil
  end

  def get_spot(board)
    puts_message
    return board.assign_spot_to(player: self, spot: 4) if board.middle_free?

    available_spaces = board.available_spaces
    spot = get_best_spot(available_spaces: available_spaces, board: board)
    board.assign_spot_to(player: self, spot: spot)
  end

  def set_diffuculty(diffuculty)
    @difficulty = diffuculty
  end

  private

  def puts_message
    print 'Computer is choosing'
    sleep(0.5)
    print '.'
    sleep(0.5)
    print '.'
    sleep(0.5)
    print ".\n"
    sleep(0.5)
  end

  def get_best_spot(available_spaces:, board:)
    if moderate_or_challenging_mode?
      best_spot = search_best_spot(available_spaces: available_spaces, board: board)
      return best_spot unless best_spot.nil?
    end

    random_spot(available_spaces)
  end

  def random_spot(available_spaces)
    random_number = rand(0..available_spaces.count)
    available_spaces[random_number].to_i
  end

  def search_best_spot(available_spaces:, board:, best_move: nil)
    available_spaces.each do |space|
      position = space.to_i

      best_move = best_spot_for?(character: @character, board: board, position: position, space: space)
      return best_move unless best_move.nil?

      if challenging_mode?
        best_move = best_spot_for?(character: other_player_character, board: board, position: position, space: space)
        return best_move unless best_move.nil?
      end

      board.positions[position] = space
    end

    best_move
  end

  def challenging_mode?
    @difficulty.challenging?
  end

  def moderate_or_challenging_mode?
    @difficulty.moderate? || challenging_mode?
  end

  def best_spot_for?(character:, board:, position:, space:)
    board.positions[position] = character
    return nil unless board.any_winner?

    best_move = position
    board.positions[position] = space
    best_move
  end

  def other_player_character
    return 'X' if @character == 'O'

    'O'
  end
end
