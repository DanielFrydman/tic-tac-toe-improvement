class Board
  attr_reader :positions

  def initialize
    @positions = %w[0 1 2 3 4 5 6 7 8]
  end

  def game_over?
    any_winner? || tie?
  end

  def print
    puts "\e[1m\e[34m===========\e[0m"
    puts " #{colorize(@positions[0])} \e[1m\e[34m|\e[0m #{colorize(@positions[1])} \e[1m\e[34m|\e[0m #{colorize(@positions[2])}"
    puts "\e[1m\e[34m===+===+===\e[0m"
    puts " #{colorize(@positions[3])} \e[1m\e[34m|\e[0m #{colorize(@positions[4])} \e[1m\e[34m|\e[0m #{colorize(@positions[5])}"
    puts "\e[1m\e[34m===+===+===\e[0m"
    puts " #{colorize(@positions[6])} \e[1m\e[34m|\e[0m #{colorize(@positions[7])} \e[1m\e[34m|\e[0m #{colorize(@positions[8])}"
    puts "\e[1m\e[34m===========\e[0m"
  end

  def available_spaces
    @positions.filter_map do |value|
      value if spot_not_occupied?(value)
    end
  end

  def any_winner?
    options.any? { |option| option.uniq.length == 1 }
  end

  def assign_spot_to(player:, spot:)
    @positions[spot] = player.character
  end

  def spot_occupied_by_player?(value)
    player_options.include? value
  end

  def position_occupied_by_player?(value)
    player_options.include? @positions[value]
  end

  def middle_free?
    @positions[4] == '4'
  end

  def tie?
    @positions.all? { |value| spot_occupied_by_player?(value) }
  end

  private

  def player_options
    %w[X O]
  end

  def colorize(value)
    return value unless spot_occupied_by_player?(value)
    return "\e[1m\e[33m#{value}\e[0m" if value == 'O'
    return "\e[1m\e[32m#{value}\e[0m" if value == 'X'
  end

  def options
    [
      [@positions[0], @positions[1], @positions[2]],
      [@positions[3], @positions[4], @positions[5]],
      [@positions[6], @positions[7], @positions[8]],
      [@positions[0], @positions[3], @positions[6]],
      [@positions[1], @positions[4], @positions[7]],
      [@positions[2], @positions[5], @positions[8]],
      [@positions[0], @positions[4], @positions[8]],
      [@positions[2], @positions[4], @positions[6]]
    ]
  end

  def spot_not_occupied?(value)
    !spot_occupied_by_player?(value)
  end
end
