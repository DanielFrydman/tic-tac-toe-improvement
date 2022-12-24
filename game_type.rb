class GameType
  PLAYER_VERSUS_PLAYER = 'player_versus_player'.freeze
  PLAYER_VERSUS_COMPUTER = 'player_versus_computer'.freeze
  COMPUTER_VERSUS_COMPUTER = 'computer_versus_computer'.freeze

  attr_reader :type

  def initialize
    @type = nil
    @option = nil
  end

  def ask_for_game_type
    puts 'Which type of game do you want to play?'
    puts "[1] - Player versus Player\n[2] - Player versus Computer\n[3] - Computer versus Computer"
    @option = gets.chomp.to_i

    until valid_option?
      puts 'Invalid option, please choose 1, 2 or 3:'
      @option = gets.chomp.to_i
    end

    set_type_of_game
  end

  def player_versus_player?
    @type == PLAYER_VERSUS_PLAYER
  end

  def player_versus_computer?
    @type == PLAYER_VERSUS_COMPUTER
  end

  def computer_versus_computer?
    @type == COMPUTER_VERSUS_COMPUTER
  end

  private

  def valid_option?
    return false unless @option.is_a? Integer

    @option.positive? && @option < 4
  end

  def set_type_of_game
    @type = type_of_game_dictionary[@option]
  end

  def type_of_game_dictionary
    {
      1 => PLAYER_VERSUS_PLAYER,
      2 => PLAYER_VERSUS_COMPUTER,
      3 => COMPUTER_VERSUS_COMPUTER
    }
  end
end
