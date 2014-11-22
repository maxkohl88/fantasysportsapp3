namespace :scraper do

  desc "fetch league stats table"
  task :create_league_stats_table => :environment do
    puts "fetching url"
    url = "http://games.espn.go.com/fba/standings?leagueId=82652&seasonId=2015"
    LeagueStatsTable.create!(LeagueStatsTable.fetch_stats_table(url))
    puts "complete"
  end

  desc "fetch daily matchup data"
  task :fetch_daily_box_scores => :environment do
    puts "Fetching box score..."
    url = "http://games.espn.go.com/fba/boxscorefull?leagueId=82652&teamId=13&scoringPeriodId=1&seasonId=2015&view=scoringperiod&version=full"
    results_hash = DailyStatLine.matchup_box_score url
    DailyStatLine.create! results_hash
    puts "Box score saved!"
  end
end
