class RenameDailyPlayerStats < ActiveRecord::Migration
  def change
    rename_table :daily_player_stats, :daily_player_results
  end
end
