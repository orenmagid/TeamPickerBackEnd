Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users
      resources :teams
      resources :groups
      resources :nba_players
    end
  end
end
