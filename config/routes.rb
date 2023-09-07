# frozen_string_literal: true

Rails.application.routes.draw do
  root to: "home#index" 

  devise_for :users
  resources :public_recipes, only: [:index]
  resources :foods, only: [:index, :new, :create, :destroy]
  resources :recipes, only: [:index, :new, :create, :destroy, :show] do
    resources :recipe_foods, only: [:new, :create, :destroy]
  end

  get '/toogle/:id', to: 'recipes#toogle'
end
