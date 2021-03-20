# frozen_string_literal: true

Rails.application.routes.draw do
  resources :shelters, except: %i[edit update sdestroy]
end
