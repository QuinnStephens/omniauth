Rails3MongoidOmniauth::Application.routes.draw do
  match '/auth/:provider/callback' => 'sessions#create'
  match '/auth/failure' => 'sessions#destroy'
  match '/signout' => 'sessions#destroy', :as => :signout
  match '/signin' => 'sessions#new', :as => :signin
end
