Startups::Application.routes.draw do
  root :to => "home#index"
  match 'startups/:id' => 'home#show', :as => :permalink_startup
  match 'startups' => "home#index"
  
  scope '/me', :as => :me do
    match 'profile' => "users#index"
    match 'edit' => "users#edit", :as => :edit
    post 'update' => "users#update", :as => :update

    resources :startups
  end  
  
  match '/auth/:provider/callback' => 'sessions#create'
  match '/signin' => 'sessions#new', :as => :signin
  match '/signout' => 'sessions#destroy', :as => :signout
  match '/auth/failure' => 'sessions#failure'

end