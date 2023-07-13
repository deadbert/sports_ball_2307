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

  describe "#add_player, #player_count" do

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

  describe "#long_term_players" do
    it "can return array of only long term players" do
      team = Team.new("Dodgers", "Los Angeles")
      player_1 = Player.new("Michael Palledorous" , 1000000, 36)
      player_2 = Player.new("Kenny DeNunez", 500000, 24)
      player_3 = Player.new("Alan McClennan", 750000, 48)
      player_4 = Player.new("Hamilton Porter", 100000, 12)

      team.add_player(player_1)
      team.add_player(player_2)
      team.add_player(player_3)
      team.add_player(player_4)

      expect(team.long_term_players).to eq([player_1, player_3])
      
    end
  end

  describe "#short_term_players" do 
    it "return an array with only short term players" do
      team = Team.new("Dodgers", "Los Angeles")
      player_1 = Player.new("Michael Palledorous" , 1000000, 36)
      player_2 = Player.new("Kenny DeNunez", 500000, 24)
      player_3 = Player.new("Alan McClennan", 750000, 48)
      player_4 = Player.new("Hamilton Porter", 100000, 12)

      team.add_player(player_1)
      team.add_player(player_2)
      team.add_player(player_3)
      team.add_player(player_4)

      expect(team.short_term_players).to eq([player_2, player_4])
    end
  end

  describe "#total_value" do
    it "returns total cost of team" do
      team = Team.new("Dodgers", "Los Angeles")
      player_1 = Player.new("Michael Palledorous" , 1000000, 36)
      player_2 = Player.new("Kenny DeNunez", 500000, 24)
      player_3 = Player.new("Alan McClennan", 750000, 48)
      player_4 = Player.new("Hamilton Porter", 100000, 12)

      team.add_player(player_1)
      team.add_player(player_2)
      team.add_player(player_3)
      team.add_player(player_4)

      expect(team.total_value).to eq(85200000)
    end
  end

  describe "#details" do
    it "return hash with total_value of team and player_count" do
      team = Team.new("Dodgers", "Los Angeles")
      player_1 = Player.new("Michael Palledorous" , 1000000, 36)
      player_2 = Player.new("Kenny DeNunez", 500000, 24)
      player_3 = Player.new("Alan McClennan", 750000, 48)
      player_4 = Player.new("Hamilton Porter", 100000, 12)

      team.add_player(player_1)
      team.add_player(player_2)
      team.add_player(player_3)
      team.add_player(player_4)

      expect(team.details).to eq({"total_value" => 85200000, "player_count" => 4})
    end
  end
end