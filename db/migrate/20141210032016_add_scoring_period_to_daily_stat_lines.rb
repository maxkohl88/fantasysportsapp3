class AddScoringPeriodToDailyStatLines < ActiveRecord::Migration
  def change
    add_column :daily_stat_lines, :scoring_period, :integer, index: true
  end
end
