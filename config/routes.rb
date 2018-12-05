Rails.application.routes.draw do

  get 'users/:id/activity_entries/:id/destroy' => 'users#delete_activity'

  get '/auth/github/callback' => 'sessions#create_with_omniauth'

  resources :challenges
  root 'welcome#index'
  get '/login', to: 'sessions#new', as: 'login'
  post '/sessions', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy', as: 'logout'

  get '/signup', to: 'users#new', as: 'signup'
  
  resources :users, only: [:create, :show, :edit, :update, :destroy, :index] do 
    resources :challenges
  end
  
  get '/entries/new', to: 'activity_entries#new', as: 'new_entry'
  resources :activity_entries, only: [:create, :edit, :destroy]

  get 'signup/admin', to: 'users#new_admin', as: 'admin_signup'
  post 'signup/admin', to: 'users#create'

  resources :users_challenges, only: [:new, :create]

  # error pages
  %w( 404 422 500 503 ).each do |code|
    get code, :to => "errors#show", :code => code
  end

  post '/avatar', to: 'users#avatar', as: 'avatar'

end