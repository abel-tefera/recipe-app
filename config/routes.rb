# frozen_string_literal: true

Rails.application.routes.draw do
  get 'recipe_foods/new'
  get 'recipe_foods/create'
  get 'recipe_foods/destroy'
  resources :recipes
  devise_for :users
  
  resources :foods, only: [:index, :new, :create, :destroy]
  
  get '/toogle/:id', to: 'recipes#toogle'

  root to: "home#index" 
end
