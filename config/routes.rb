# frozen_string_literal: true

Rails.application.routes.draw do
  resources :recipes
  devise_for :users
  
  resources :foods, only: [:index, :new, :create, :destroy]
  
  get '/toogle/:id', to: 'recipes#toogle'

  root to: "home#index" 
end
