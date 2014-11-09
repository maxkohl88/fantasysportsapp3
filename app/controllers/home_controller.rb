class HomeController < ApplicationController

  helper_method :all_stats

  def show
  end

  private

  def stats_table
    url = "http://games.espn.go.com/fba/standings?leagueId=82652&seasonId=2015"
    @stats_table ||= LeagueStatsTable.fetch_stats_table url
  end

  def stats_rows
    @stats_rows ||= LeagueStatsTable.parse_rows stats_table 
  end

  def all_stats
    @first_row_name ||= LeagueStatsTable.parse_stats stats_rows
  end

end
