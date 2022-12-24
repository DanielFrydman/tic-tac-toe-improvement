class Difficulty
  EASY = 'easy'.freeze
  MODERATE = 'moderate'.freeze
  CHALLENGING = 'challenging'.freeze

  def initialize
    @level = nil
    @option = nil
  end

  def ask_for_game_difficulty
    puts 'Which difficulty do you want to play?'
    puts "[1] - Easy\n[2] - Moderate\n[3] - Challenging"
    @option = gets.chomp.to_i

    until valid_option?
      puts 'Invalid option, please choose 1, 2 or 3:'
      @option = gets.chomp.to_i
    end

    set_level
  end

  def easy?
    @level == EASY
  end

  def moderate?
    @level == MODERATE
  end

  def challenging?
    @level == CHALLENGING
  end

  private

  def valid_option?
    return false unless @option.is_a? Integer

    @option.positive? && @option < 4
  end

  def set_level
    @level = difficulty_dictionary[@option]
  end

  def difficulty_dictionary
    {
      1 => EASY,
      2 => MODERATE,
      3 => CHALLENGING
    }
  end
end