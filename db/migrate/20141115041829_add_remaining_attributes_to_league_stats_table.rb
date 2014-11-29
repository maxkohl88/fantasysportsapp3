class AddRemainingAttributesToLeagueStatsTable < ActiveRecord::Migration
  def change
    change_table :league_stats_tables do |t|
      t.integer :free_throws_made
      t.integer :free_throws_attempted
      t.integer :rebounds
      t.integer :assists
      t.integer :steals
      t.integer :blocks
      t.integer :turnovers
      t.integer :points
      t.integer :points_for
      t.integer :points_against
      t.string :current_streak

      t.timestamps
    end
  end
end
