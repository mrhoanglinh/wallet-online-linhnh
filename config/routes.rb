Rails.application.routes.draw do

  devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "homes#index"

  #get 'categories', to: 'categories#index'
  resources :categories
  resources :costs
  resources :incomes

  get 'categories/:id/edit', to: "categories#edit"
  get 'categories/show'
  get 'costs/show', to: "costs#show"

  
  get 'costs/:id/edit', to: "costs#edit"
end
