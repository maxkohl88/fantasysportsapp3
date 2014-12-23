namespace :scraper do

  desc "fetch league stats table"
  task :create_league_stats_table => :environment do
    puts "fetching url"
    url = "http://games.espn.go.com/fba/standings?leagueId=82652&seasonId=2015"
    LeagueStatsTable.create!(LeagueStatsTable.fetch_stats_table(url))
    puts "complete"
  end

  desc "create league and teams from stats table"
  task :create_league_and_teams => :environment do
    wbl = League.create! name: "The World Basketball League", espn_id: 82652
  end

  desc "fetch league teams"
  task :fetch_league_teams => :environment do
    espn_id = 82652
    name = "The World Basketball League"
    season_id = 2015
    puts "fetching teams for league #{espn_id}"
    url = "http://games.espn.go.com/fba/standings?leagueId=#{espn_id}&seasonId=#{season_id}"
    league = League.new
    teams = league.import_teams url
  end

  desc "fetch daily stats"
  task :fetch_daily_stats => :environment do
    wbl = League.find_by name: "The World Basketball League"
    scoring_period = 5
    wbl.teams.each do |team|
      url = "http://games.espn.go.com/fba/boxscorefull?leagueId=#{wbl.espn_id}&teamId=#{team.espn_id}&scoringPeriodId=#{scoring_period}&seasonId=2015&view=scoringperiod&version=full"
      stat_lines = DailyStatLine.extract_stats url, scoring_period

      stat_lines.each do |stat_line|
        begin
          line = DailyStatLine.new
          line.attributes = stat_line
          line.team = team
          line.scoring_period = scoring_period
          line.save!
        rescue ActiveRecord::RecordInvalid => e
          puts "Stat line not saved because #{e}"
        end
      end

      puts "Box score scraped #{wbl.name} - #{team.name} - #{scoring_period}"
      puts "Box score saved!"
    end
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
