# frozen_string_literal: true

Rails.application.routes.draw do
  root to: "home#index" 

  devise_for :users
  
  resources :foods, only: [:index, :new, :create, :destroy]
  resources :recipes, only: [:index, :new, :create, :destroy, :show]

  get 'recipe_foods/new'
  get 'recipe_foods/create'
  get 'recipe_foods/destroy'

  get '/toogle/:id', to: 'recipes#toogle'
end
