module NokoScraper
  require 'open-uri'
  def self.extract_website(url)
    Nokogiri::HTML(open(url))
  end

  def extract_row_values(rows, constant, team)
    table_stats_hash_array = []

    rows.each do |row|
      stats_hash = {}
      stats_hash[:owner] = team
      stats_hash[:roster_spot] = row.css('.playerSlot').text
      stats_hash[:player_name] = row.css('.playertablePlayerName a').text
      counting_stats = row.css('.playertableStat')
      counting_stats_values = counting_stats.map { |stat| stat.text }
      counting_stats_hash = Hash[constant.zip counting_stats_values]
      stats_hash.merge! counting_stats_hash
      stats_hash[:fantasy_points] = row.css('.appliedPointsProGameFinal').text
      table_stats_hash_array << stats_hash
    end

    table_stats_hash_array
  end
end
