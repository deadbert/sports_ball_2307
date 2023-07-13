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
end