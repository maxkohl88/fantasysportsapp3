class CreateLeagueStatsTable < ActiveRecord::Migration
  def change
    create_table :league_stats_tables do |t|
      t.string :team_name, unique: true
      t.integer :field_goals_made
      t.integer :field_goals_attempted
    end
  end
end
