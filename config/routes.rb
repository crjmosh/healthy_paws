Rails.application.routes.draw do
  devise_for :users, controllers: {:omniauth_callbacks => "omniauth_callbacks"}
	root 'pets#index'
  
  get '/about', to: "static_pages#about", as: 'about'

  resources :pets do
  	resources :appointments
  	resources :medicals
  end
end
