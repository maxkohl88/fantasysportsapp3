desc "This is a test"
task :test_task do
  puts "Hey kid! I'm a computa!"
end

namespace :scraper do

  desc "fetch league stats table"
  task :league_stats_table => :environment do
    url = "http://games.espn.go.com/fba/standings?leagueId=82652&seasonId=2015"
    table = LeagueStatsTable.fetch_stats_table url
    puts table
  end
end
