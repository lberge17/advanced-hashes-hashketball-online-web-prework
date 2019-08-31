require "pry"

def game_hash
 game_data = {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => {
        "Alan Anderson" => {
          :number => 0,
          :shoe => 16,
          :points => 22,
          :rebounds => 12,
          :assists => 12,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 1
        },
        "Reggie Evans" => {
          :number => 30,
          :shoe => 14,
          :points => 12,
          :rebounds => 12,
          :assists => 12,
          :steals => 12,
          :blocks => 12,
          :slam_dunks => 7
        },
        "Brook Lopez" => {
          :number => 11,
          :shoe => 17,
          :points => 17,
          :rebounds => 19,
          :assists => 10,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 15
        },
        "Mason Plumlee" => {
          :number => 1,
          :shoe => 19,
          :points => 26,
          :rebounds => 11,
          :assists => 6,
          :steals => 3,
          :blocks => 8,
          :slam_dunks => 5
        },
        "Jason Terry" => {
          :number => 31,
          :shoe => 15,
          :points => 19,
          :rebounds => 2,
          :assists => 2,
          :steals => 4,
          :blocks => 11,
          :slam_dunks => 1
        }
      }
    },
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => {
        "Jeff Adrien" => {
          :number => 4,
          :shoe => 18,
          :points => 10,
          :rebounds => 1,
          :assists => 1,
          :steals => 2,
          :blocks => 7,
          :slam_dunks => 2
        },
        "Bismack Biyombo" => {
          :number => 0,
          :shoe => 16,
          :points => 12,
          :rebounds => 4,
          :assists => 7,
          :steals => 22,
          :blocks => 15,
          :slam_dunks => 10
        },
        "DeSagna Diop" => {
          :number => 2,
          :shoe => 14,
          :points => 24,
          :rebounds => 12,
          :assists => 12,
          :steals => 4,
          :blocks => 5,
          :slam_dunks => 5
        },
        "Ben Gordon" => {
          :number => 8,
          :shoe => 15,
          :points => 33,
          :rebounds => 3,
          :assists => 2,
          :steals => 1,
          :blocks => 1,
          :slam_dunks => 0
        },
        "Kemba Walker" => {
          :number => 33,
          :shoe => 15,
          :points => 6,
          :rebounds => 12,
          :assists => 12,
          :steals => 7,
          :blocks => 5,
          :slam_dunks => 12
        }
      }
    }
  }
  game_data
end

def num_points_scored(name)
  points = 0
  game_data = game_hash
  game_data.each do |location, info| 
    info.each do |attribute, data| 
      if attribute == :players 
       data.each do |player_name, stats|
         if player_name == name
           stats.each do |stat, value|
             if stat == :points
               points = value
             end
           end
         end
       end
      end
    end
  end
  points
end

def shoe_size(name)
  size = 0
  game_data = game_hash
  game_data.each do |location, info| 
    info.each do |attribute, data| 
      if attribute == :players 
       data.each do |player_name, stats|
         if player_name == name
           stats.each do |stat, value|
             if stat == :shoe
               size = value
             end
           end
         end
       end
      end
    end
  end
  size
end

def team_colors(team)
  colors = []
  game_data = game_hash
  game_data.each do |location, info| 
    info.each do |attribute, data| 
      if attribute == :colors && info[:team_name] == team
       colors = data
      end
    end
  end
  colors
end

def team_names
  teams = []
  game_data = game_hash
  game_data.each do |location, info|
    info.each do |attribute, data| 
      if attribute == :team_name
        teams.push(data)
      end
    end
  end
  teams
end

def player_numbers(team)
  numbers = []
  game_data = game_hash
  
  if team == "Brooklyn Nets"
    local = :home
  elsif team == "Charlotte Hornets"
    local = :away
  end
  
  game_data.each do |location, info|
    if location == local
      info.each do |attribute, data|
        if attribute == :players 
          data.each do |player_name, stats|
            stats.each do |stat, value|
              if stat == :number
                numbers.push(value)
              end
            end
          end
        end
      end
    end
  end
  numbers
end

def player_stats(name)
  all_stats = {}
  game_data = game_hash
  game_data.each do |location, info| 
    info.each do |attribute, data| 
      if attribute == :players 
        data.each do |player_name, stats|
          if player_name == name
            stats.each do |stat, value|
              all_stats[stat] = value
            end
          end
        end
      end
    end
  end
  all_stats
end

def big_shoe_rebounds
  shoe_size = 0
  rebounds = 0
  game_data = game_hash
  game_data.each do |location, info| 
    info.each do |attribute, data| 
      if attribute == :players 
        data.each do |player_name, stats|
          if stats[:shoe] > shoe_size
            shoe_size = stats[:shoe]
            rebounds = stats[:rebounds]
          end
        end
      end
    end
  end
  rebounds
end
