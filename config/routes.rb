Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :filters
  resources :athletes

  get 'leaderboard' => 'leaderboard#index'
  get 'open' => 'leaderboard#open'
  get 'online_qualifier' => 'leaderboard#online_qualifier'
  get 'regionals' => 'leaderboard#regionals'
  get 'games' => 'leaderboard#games'
  post 'filter' => 'leaderboard#filter'
  post 'filter_regional' => 'leaderboard#filter_regional'
  post 'search' => 'leaderboard#search'
  get 'about' => 'home#about'
  get 'scrape_regionals' => 'home#scrape_regionals'
  get 'cross-regional' => 'leaderboard#cross_regional'
  get 'games' => 'leaderboard#games'

  get 'hubspot/app/involvements' => 'hubspot#involvements'

  get 'fantasy2018' => 'home#fantasy2018'


  #root 'leaderboard#online_qualifier'
  root 'leaderboard#regionals'
end
