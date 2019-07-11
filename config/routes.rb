# frozen_string_literal: true

Rails.application.routes.draw do
  root "users#index"

  scope :supervisor do
    resources :users
    resources :subjects, except: :show
    resources :courses, except: :show
  end
end
