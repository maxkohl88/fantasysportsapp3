class LeagueStatsTable < ActiveRecord::Base
  require 'open-uri'

  def self.fetch_stats_table(url)
    table = Nokogiri::HTML(open(url)).at_css '#statsTable'
    rows = table.css '.sortableRow'
    stats_hash = LeagueStatsTable.parse_stats rows
    stats_hash
  end

  def self.parse_stats(rows)
    all_stats = []

    rows.each do |row|

      stats_hash = {}
    
      stats_hash[:team_name] = row.css('a').text
      stats_hash[:espn_id] = row.at_css('a')[:href].split('&teamId=')[1].split('&').first.to_i
      stats_hash[:field_goals_made] = row.css('.sortableStat13').text
      stats_hash[:field_goals_attempted] = row.css('.sortableStat14').text
      stats_hash[:free_throws_made] = row.css('.sortableStat15').text
      stats_hash[:free_throws_attempted] = row.css('.sortableStat16').text
      stats_hash[:rebounds] = row.css('.sortableStat6').text
      stats_hash[:assists] = row.css('.sortableStat3').text
      stats_hash[:steals] = row.css('.sortableStat2').text
      stats_hash[:blocks] = row.css('.sortableStat1').text
      stats_hash[:turnovers] = row.css('.sortableStat11').text
      stats_hash[:points] = row.css('.sortableStat0').text
      stats_hash[:points_for] = row.css('.sortablePF').text
      stats_hash[:points_against] = row.css('.sortablePA').text
      stats_hash[:current_streak] = row.css('.sortableSTRK').text

      all_stats << stats_hash 
    end

    all_stats
  end
end
