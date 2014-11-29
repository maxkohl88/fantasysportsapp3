class RenameDailyPlayerResultsToDailyStatLines < ActiveRecord::Migration
  def change
    rename_table :daily_player_results, :daily_stat_lines
  end
end
