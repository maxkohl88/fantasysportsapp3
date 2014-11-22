class RenameGamePlayedToGamesPlayedOnDailyPlayerResult < ActiveRecord::Migration
  def change
    rename_column :daily_player_results, :game_played, :games_played
  end
end
