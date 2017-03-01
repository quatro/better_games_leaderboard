Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :filters
  resources :athletes

  get 'leaderboard' => 'leaderboard#index'
  post 'filter' => 'leaderboard#filter'
  get 'about' => 'home#about'


  root 'leaderboard#index'
end
