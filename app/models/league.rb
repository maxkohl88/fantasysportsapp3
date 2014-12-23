class League < ActiveRecord::Base
  extend NokoScraper
  has_many :teams

  def import_teams(url)
    website = NokoScraper.extract_website url
  end
end
