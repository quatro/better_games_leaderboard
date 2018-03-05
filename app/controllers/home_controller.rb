class HomeController < ApplicationController
  def about; end
  def scrape_regionals

    RegionalScraper.new.delay.scrape

    # Rank everything by divisions (men, women, team)
    RegionalCacher.new.delay.rank(2018)

    render json:{status:'success'}
  end
end