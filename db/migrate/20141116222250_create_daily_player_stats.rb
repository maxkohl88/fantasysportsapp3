class CreateDailyPlayerStats < ActiveRecord::Migration
  def change
    create_table :daily_player_stats do |t|
      t.string :roster_spot, index: true
      t.string :player_name, index: true
      t.integer :game_played, index: true
      t.integer :minutes_played
      t.integer :field_goals_made
      t.integer :field_goals_attempted
      t.integer :free_throws_made
      t.integer :free_throws_attempted
      t.integer :rebounds
      t.integer :assists
      t.integer :steals
      t.integer :blocks
      t.integer :turnovers
      t.integer :points
      t.integer :fantasy_points

      t.references
    end
  end
end
