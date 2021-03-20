# frozen_string_literal: true

Rails.application.routes.draw do
  resources :shelters
  resources :pets, omly: :index
end
