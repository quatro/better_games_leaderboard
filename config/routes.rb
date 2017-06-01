Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :filters
  resources :athletes

  get 'leaderboard' => 'leaderboard#index'
  get 'open' => 'leaderboard#open'
  get 'regionals' => 'leaderboard#regionals'
  get 'games' => 'leaderboard#games'
  post 'filter' => 'leaderboard#filter'
  post 'filter_regional' => 'leaderboard#filter_regional'
  post 'search' => 'leaderboard#search'
  get 'about' => 'home#about'
  get 'scrape_regionals' => 'home#scrape_regionals'
  get 'cross_regional' => 'leaderboard#cross_regional'


  root 'leaderboard#regionals'
end
