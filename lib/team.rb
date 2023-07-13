class Team
  attr_reader :team_name, :team_location, :roster

  def initialize(team_name, team_location)
    @team_name = team_name
    @team_location = team_location
    @roster = []
  end

  def player_count
    @roster.count
  end

  def add_player(player)
    @roster << player
  end

  def long_term_players
    long_players = @roster.select do |player|
      player.contract_length > 24
    end
    long_players.sort_by {|player| player.contract_length}
  end

  def short_term_players
    short_players = @roster.select do |player|
      player.contract_length <= 24
    end
    short_players.sort_by {|player| player.contract_length}
  end

  def total_value
    @roster.reduce(0) do |sum, player|
      sum + player.total_cost
    end
  end

  def details
    {
      "total_value" => total_value,
      "player_count" => player_count
    }
  end

  # def average_cost_of_player
  #  format_cost(total_value / player_count)
  # end

  # def format_cost(cost)
  #   cost_reverse_arr = []
  #   cost.to_s.chars.reverse.each_slice(3) do |slice|
  #     cost_reverse_arr << slice
  #   end
  #   require 'pry';binding.pry
  #   cost_reverse_arr.reverse.join(',')
  # end
end