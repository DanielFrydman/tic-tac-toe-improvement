class Board
  attr_reader :board

  def initialize
    @board = %w[0 1 2 3 4 5 6 7 8]
    @palyer_one = 'X'
    @palyer_two = 'O'
  end

  def print_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} \n===+===+===\n #{@board[3]} | #{@board[4]} | #{@board[5]} \n===+===+===\n #{@board[6]} | #{@board[7]} | #{@board[8]} \n"
  end

  def middle_free?
    @board[4] == '4'
  end

  def assign_spot_to(spot, player)
    @board[spot] = player
  end

  def space_not_occupied?(space)
    space_not_occupied_by_user?(space) && space_not_occupied_by_computer?(space)
  end

  def space_occupied_by_user?(space)
    !space_not_occupied_by_user?(space)
  end

  def space_occupied_by_computer?(space)
    !space_not_occupied_by_computer?(space)
  end

  def spot_not_occupied_by_palyer_two?(spot)
    spot != 'O'
  end

  def spot_not_occupied_by_palyer_one?(spot)
    spot != 'X'
  end

  def available_spaces(board)
    board.filter_map do |space|
      space if space_not_occupied?(space)
    end
  end
end