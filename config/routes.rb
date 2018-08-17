Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users
      resources :teams
      resources :groups
      resources :nba_players
      resources :comparisons
      get 'comparisons/group/:id', to: 'comparisons#filtered_index'
      
      
    end
  end
end
