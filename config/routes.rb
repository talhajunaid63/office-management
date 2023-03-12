# frozen_string_literal: true

Rails.application.routes.draw do
  resources :users
  root 'home#index'

  devise_for :users
  resources :companies
end
