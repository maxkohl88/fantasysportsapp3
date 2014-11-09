json.teams all_stats.each do |team|

  json.name team[:name]
  json.field_goals_made team[:field_goals_made]
  json.field_goals_attempted team[:field_goals_attempted]
  json.free_throws_made team[:free_throws_made]
  json.free_throws_attempted team[:free_throws_attempted]
  json.rebounds team[:rebounds]
  json.assists team[:assists]
  json.steals team[:steals]
  json.blocks team[:blocks]
  json.turnovers team[:turnovers]
  json.points team[:points]

  json.season_stats do 
    json.points_for team[:points_for]
    json.points_against team[:points_against]
    json.current_streak team[:current_streak]
  end

end
