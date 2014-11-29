namespace :scraper do

  desc "fetch league stats table"
  task :create_league_stats_table => :environment do
    puts "fetching url"
    url = "http://games.espn.go.com/fba/standings?leagueId=82652&seasonId=2015"
    LeagueStatsTable.create!(LeagueStatsTable.fetch_stats_table(url))
    puts "complete"
  end

  desc "fetch league teams"
  task :fetch_league_teams => :environment do
    league_id = 82652
    season_id = 2015
    puts "fetching teams for league #{league_id}"
    url = "http://games.espn.go.com/fba/standings?leagueId=#{league_id}&seasonId=#{season_id}"
  end

  desc "fetch daily matchup data"
  task :fetch_daily_stat_lines => :environment do
    
    scoring_period = 1
    27.times do 
      
      puts "Fetching box score for scoring period #{scoring_period}..."
      url = "http://games.espn.go.com/fba/boxscorefull?leagueId=82652&teamId=13&scoringPeriodId=#{scoring_period}&seasonId=2015&view=scoringperiod&version=full"
      puts "Box score scraped"
      results_hash = DailyStatLine.matchup_box_score url
      puts "Box score parsed"
      DailyStatLine.create! results_hash
      puts "Box score saved!"
      scoring_period += 1
    end
  end
end
