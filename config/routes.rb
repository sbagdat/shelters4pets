# frozen_string_literal: true

Rails.application.routes.draw do
  resources :shelters, only: [:index]
end
