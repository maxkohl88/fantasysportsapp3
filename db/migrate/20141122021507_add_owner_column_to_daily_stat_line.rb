class AddOwnerColumnToDailyStatLine < ActiveRecord::Migration
  def change
    add_column :daily_stat_lines, :owner, :string, index: true, first: true
  end
end
