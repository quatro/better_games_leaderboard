Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :filters
  resources :athletes

  get 'leaderboard' => 'leaderboard#index'
  get 'open' => 'leaderboard#open'
  get 'regionals' => 'leaderboard#regionals'
  get 'games' => 'leaderboard#games'
  post 'filter' => 'leaderboard#filter'
  post 'filter' => 'leaderboard#filter_regional'
  post 'search' => 'leaderboard#search'
  get 'about' => 'home#about'


  root 'leaderboard#regionals'
end
