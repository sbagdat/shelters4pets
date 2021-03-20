# frozen_string_literal: true

Rails.application.routes.draw do
  resources :shelters do
    get "pets", on: :member, to: "pets#shelter_pets"
  end
  resources :pets, omly: %i[index show]
end
