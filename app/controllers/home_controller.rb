class HomeController < ApplicationController
  def about; end
  def scrape_regionals

    RegionalScraper.new.delay.scrape

    # Rank everything by divisions (men, women, team)
    RegionalCacher.new.delay.rank(2019)

    render json:{status:'success'}
  end

  def fantasy2018
    # 1, 2, 11
    division = params[:division].present? ? params[:division] : 1
    regional = 32
    year = 2018
    sort = 0
    page = 1

    #results = scraper.filter_regional(division, year, regional, sort, page)
    results = scraper.filter_games(division, year, sort, page)
    hash = JSON.parse(results.body)
    #return render json:hash
    return render partial:'fantasy2018', locals:{page:page, results:results, current_page: page}
  end

  def fantasy2019
    # 1, 2, 11
    division = params[:division].present? ? params[:division] : 1
    regional = 32
    year = 2019
    sort = 0
    page = 1

    #results = scraper.filter_regional(division, year, regional, sort, page)
    results = scraper.filter_games(division, year, sort, page)
    hash = JSON.parse(results.body)
    #return render json:hash
    return render partial:'fantasy2019', locals:{page:page, results:results, current_page: page}
  end


  private
  def scraper
    @scraper ||= Scraper.new
  end
end