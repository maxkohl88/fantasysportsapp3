class AddTimestampsToDailyStatLines < ActiveRecord::Migration
  def change
    add_column :daily_stat_lines, :created_at, :datetime
    add_column :daily_stat_lines, :updated_at, :datetime
  end
end
