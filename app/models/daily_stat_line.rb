class DailyStatLine < ActiveRecord::Base
  include NokoScraper
  belongs_to :team
  validates_presence_of :player_name

  COUNTING_STATS = %i(games_played minutes_played field_goals_made 
    field_goals_attempted free_throws_made free_throws_attempted rebounds 
    assists steals blocks turnovers points)

  def attributes=(hash)
    hash.each do |key, value|
      send "#{key}=", value
    end
  end

  def self.extract_stats(url, scoring_period)
    website = NokoScraper.extract_website url

    both_box_scores = website.css '.playerTableTable'

    team_1_starters = both_box_scores[0].css '.pncPlayerRow'
    team_1_bench = both_box_scores[1].css '.pncPlayerRow'
    team_1_starters_array = NokoScraper.extract_row_values team_1_starters, COUNTING_STATS, scoring_period
    team_1_bench_array = NokoScraper.extract_row_values team_1_bench, COUNTING_STATS, scoring_period
    team_1_total_stats = team_1_starters_array.push *team_1_bench_array
  end
end
