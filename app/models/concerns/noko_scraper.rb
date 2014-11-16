Module NokoScraper
  require 'open-uri'

  def extract_website(url)
    Nokogiri::HTML(open(url))
  end

  def extract_table(website, css_selector)
    website.css css_selector
  end

end
