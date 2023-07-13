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
    @roster.select do |player|
      player.contract_length > 24
    end
  end

  def short_term_players
    @roster.select do |player|
      player.contract_length <= 24
    end
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
end