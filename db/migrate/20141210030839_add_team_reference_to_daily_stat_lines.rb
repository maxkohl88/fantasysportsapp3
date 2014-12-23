class AddTeamReferenceToDailyStatLines < ActiveRecord::Migration
  def change
    add_reference :daily_stat_lines, :team, index: true
  end
end
