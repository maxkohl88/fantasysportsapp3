namespace :scraper do

  desc "fetch league stats table"
  task :create_league_stats_table => :environment do
    puts "fetching url"
    url = "http://games.espn.go.com/fba/standings?leagueId=82652&seasonId=2015"
    LeagueStatsTable.create!(LeagueStatsTable.fetch_stats_table(url))
    puts "complete"
  end
end
