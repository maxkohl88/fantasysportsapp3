class HomeController < ApplicationController

  helper_method :document

  def show
    binding.pry
  end

  private

  def document
    @doc ||= Nokogiri::HTML(open("http://games.espn.go.com/fba/clubhouse?leagueId=82652&teamId=13&seasonId=2015"))
  end

end
