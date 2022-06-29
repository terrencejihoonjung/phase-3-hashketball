# Write your code below game_hash
require 'pry'

def game_hash
  {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: [
        {
          player_name: "Alan Anderson",
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        },
        {
          player_name: "Reggie Evans",
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        },
        {
          player_name: "Brook Lopez",
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },
        {
          player_name: "Mason Plumlee",
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 11,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },
        {
          player_name: "Jason Terry",
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        }
      ]
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: [
        {
          player_name: "Jeff Adrien",
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        },
        {
          player_name: "Bismack Biyombo",
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 22,
          blocks: 15,
          slam_dunks: 10
        },
        {
          player_name: "DeSagna Diop",
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
        {
          player_name: "Ben Gordon",
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
        {
          player_name: "Kemba Walker",
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 7,
          blocks: 5,
          slam_dunks: 12
        }
      ]
    }
  }
end

# All Players 
def all_players
  game_hash[:home][:players] + game_hash[:away][:players]
end

# Team Players
def team_players(team_name)
  game_hash.each do |location, info|
    if info[:team_name] == team_name
      return info[:players]
    end
  end
end

# Points Scored for a Player
def num_points_scored(player)
  selected_player = all_players.find {|person| person[:player_name] == player }
  selected_player[:points]
end

def team_names
  [game_hash[:home][:team_name], game_hash[:away][:team_name]]
end

def team_colors(team_name)
  game_hash.each do |location, info|
    if info[:team_name] == team_name
      return info[:colors]
    end
  end
end

def player_numbers(team_name)
  team_players(team_name).map {|player| player[:number]}
end

def player_stats(player)
  all_players.find {|person| person[:player_name] == player}
end

def shoe_size(player)
  person = all_players.find {|person| person[:player_name] == player}
  person[:shoe]
end

def big_shoe_rebounds
  max_shoe = all_players.max_by {|person| person[:shoe]}
  max_shoe[:rebounds]
end

def most_points_scored
  all_players.max_by {|person| person[:points]}
end

def winning_team
  team_points = 0
  team = ""
  game_hash.each do |location, info|
    points = info[:players].sum {|person| person[:points]}
    if points > team_points
      team = info[:team_name]
      team_points = points
    else
      next
    end 
  end
  team
end

def player_with_longest_name
  all_players.max_by {|person| person[:player_name].length}
end

def most_steals
  all_players.max_by {|person| person[:steals]}
end

def long_name_steals_a_ton 
  player_with_longest_name == most_steals
end
