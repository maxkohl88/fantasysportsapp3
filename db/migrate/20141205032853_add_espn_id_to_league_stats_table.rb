class AddEspnIdToLeagueStatsTable < ActiveRecord::Migration
  def change
    add_column :league_stats_tables, :espn_id, :integer
  end
end
