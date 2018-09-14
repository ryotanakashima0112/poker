Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'toppages#index'
  
  mount API::Root => '/'

  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      get "gamepokers/new", to: "gamepokers#new"
      post "gamepokers/judge", to: 'gamepokers#judge'
    end
  end
end
