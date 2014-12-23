class Team < ActiveRecord::Base
  belongs_to :league
  has_many :daily_stat_lines

  
end
