class HomeController < ApplicationController
  def about; end
  def scrape_regionals

    [1,2,11].each do |division|
      Filter.regional_options.each do |regional_name, regional|
        store_results(scraper.filter_regional(division, regional, 0, 1))
      end
    end

    # Rank everything by divisions (men, women, team)
    RegionalCacher.new.rank(2017)
  end


  private
  def scraper
    @scraper ||= Scraper.new
  end

  def store_results(results)
    results['athletes'].each do |athlete|
      model = Athlete.get_from_json(athlete)
      model.store_json_scores(athlete['scores']) if athlete['scores']

    end
  end
end