require 'open-uri'
require 'pry'
require 'nokogiri'

url = "http://games.espn.go.com/fba/boxscorefull?leagueId=82652&teamId=13&scoringPeriodId=18&seasonId=2015&view=scoringperiod&version=full"

both_tables = Nokogiri::HTML(open(url)).css '.playerTableTable'

team_1_starters = both_tables[0]
team_1_bench = both_tables[1]
team_2_starters = both_tables[2]
team_2_bench = both_tables[3]

def extract_rows(table)
  table.css '.pncPlayerRow'
end

def extract_row_values(rows, bench = false)

  table_stats_hash_array = []

  rows.each do |row|
    stats_hash = {}

    stats_hash[:roster_spot] = row.css('.playerSlot').text
    stats_hash[:player_name] = row.css('.playertablePlayerName a').text
    
    counting_stats = row.css('.playertableStat')

    counting_stats_values = counting_stats.map { |stat| stat.text } 

    counting_stats_names = [:game_played, :minutes_played, :field_goals_made, :field_goals_attempted, :free_throws_made, :free_throws_attempted, :rebounds, :assists, :steals, :blocks, :turnovers, :points]

    counting_stats_hash = Hash[counting_stats_names.zip counting_stats_values]

    stats_hash.merge! counting_stats_hash

    stats_hash[:fantasy_points] = row.css '.appliedPointsProGameFinal'

    table_stats_hash_array << stats_hash
  end

  table_stats_hash_array
end

team_1_starters_hash = extract_row_values extract_rows(team_1_starters)
team_1_bench_hash = extract_row_values extract_rows(team_1_bench)
team_2_starters_hash = extract_row_values extract_rows(team_2_starters)
team_2_bench_hash = extract_row_values extract_rows(team_2_bench)

team_1_total_stats = team_1_starters_hash.merge team_1_bench_hash

team_2_total_stats = team_2_starters_hash.merge team_2_bench_hash
