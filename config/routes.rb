# frozen_string_literal: true

Rails.application.routes.draw do
  root to: "shelters#index"
  resources :pets, except: %i[new create]

  resources :shelters do
    resources :pets, only: %i[index new create]
  end
end
