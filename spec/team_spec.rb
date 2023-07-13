require './lib/player'
require './lib/team'

describe Team do
  
  describe "#initialize" do

    it "exists, and initializes with empty roster array" do
      team = Team.new("Dodgers", "Los Angeles")

      expect(team).to be_a(Team)
      expect(team.roster).to eq([])
    end
  end

  describe "#player_count" do

    it "can add and count players on the team" do
      team = Team.new("Dodgers", "Los Angeles")

      expect(team.player_count).to eq(0)

      player_1 = Player.new("Michael Palledorous" , 1000000, 36)
      player_2 = Player.new("Michael Palledorous" , 1000000, 36)
      team.add_player(player_1)
      team.add_player(player_2)

      expect(team.roster).to eq([player_1, player_2])
      expect(team.player_count).to eq(2)
    end
  end
end