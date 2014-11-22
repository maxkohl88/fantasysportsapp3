class DailyStatLine < ActiveRecord::Base
  extend NokoScraper

  COUNTING_STATS = %i(games_played minutes_played field_goals_made 
    field_goals_attempted free_throws_made free_throws_attempted rebounds 
    assists steals blocks turnovers points)

  def self.matchup_box_score(url)
    website = extract_website url
    both_box_scores = website.css '.playerTableTable'

    team_1_starters = both_box_scores[0].css '.pncPlayerRow'
    team_1_bench = both_box_scores[1].css '.pncPlayerRow'
    team_2_starters = both_box_scores[2].css '.pncPlayerRow'
    team_2_bench = both_box_scores[3].css '.pncPlayerRow'

    team_1_starters_array = extract_row_values team_1_starters, COUNTING_STATS,
      both_box_scores.css('.playertablePlayerHeader').css('td').text.gsub!(/\sBox\sScore/, '') 
    team_1_bench_array = extract_row_values team_1_bench, COUNTING_STATS,
      both_box_scores.css('.playertablePlayerHeader').css('td').text.gsub!(/\sBox\sScore/, '')
    team_2_starters_array = extract_row_values team_2_starters, COUNTING_STATS,
      both_box_scores.css('.playertablePlayerHeader').css('td').text.gsub!(/\sBox\sScore/, '')
    team_2_bench_array = extract_row_values team_2_bench, COUNTING_STATS,
      both_box_scores.css('.playertablePlayerHeader').css('td').text.gsub!(/\sBox\sScore/, '')
    team_1_total_stats = team_1_starters_array.push *team_1_bench_array
    team_2_total_stats = team_2_starters_array.push *team_2_bench_array

    team_1_total_stats.push *team_2_total_stats
  end
end
