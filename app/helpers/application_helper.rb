module ApplicationHelper


  def strip_html_tags(val)
    strip_tags(val)
  end

  def default_twitter_handle
    '@wodfollow'
  end


  # Returns the full title on a per-page basis
  def full_title(page_title = '')
    base_title = "BGL"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end

  def leaderboard_results_per_page
    50
  end

end
