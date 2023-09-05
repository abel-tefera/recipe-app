# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  
  resources :foods, only: [:index, :new, :create, :destroy]

  root to: "home#index" 
end
