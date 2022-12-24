require_relative 'player.rb'

class User < Player
  def get_spot(board)
    option = nil

    until option
      puts 'Enter [0-8]:'
      option = gets.chomp

      until valid_option?(option)
        puts 'Invalid option, please choose [0-8]:'
        option = gets.chomp
      end

      if board.position_occupied_by_player?(option.to_i)
        puts 'Occupied space, please choose another spot...'
        option = nil
        next
      end

      board.assign_spot_to(player: self, spot: option.to_i)
    end
  end

  private

  def valid_option?(option)
    return true if option == '0'

    option = option.to_i
    return false if option.zero?

    option.positive? && option < 9
  end
end
