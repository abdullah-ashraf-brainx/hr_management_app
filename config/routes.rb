Rails.application.routes.draw do
  

  resources :hiring_positions do
    resources :candidates
  end
  devise_for :admin_users, controllers: {
    sessions: 'admin_users/sessions',
    registrations: 'admin_users/registrations'
  }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to: "hiring_positions#index"

end
