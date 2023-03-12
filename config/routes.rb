# frozen_string_literal: true

Rails.application.routes.draw do
  root 'home#index'

  devise_for :users
  resources :companies do
    resources :users
    resources :salaries
    resources :expenses
  end
end
