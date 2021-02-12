# frozen_string_literal: true

Rails.application.routes.draw do
  get 'searches/search'
  devise_for :end_users, controllers: {
    registrations: 'end_users/registrations',
    sessions: 'end_users/sessions'
  }

  devise_scope :end_user do # ゲストログイン機能に関するルーティング
    post 'end_users/guest_sign_in', to: 'end_users/sessions#new_guest'
  end

  devise_for :admins, controllers: {
    sessions: 'admins/sessions'
  }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  scope module: :public do
    root to: 'homes#top'
    get 'about' => 'homes#about'
    get 'top' => 'manuals#top'

    resources :end_users, only: %i[show edit update] do
      member do
        patch 'withdraw'
      end
    end

    resources :reviews do
      resources :comments, only: %i[create destroy]
      resource :favorites, only: %i[create destroy]
      resources :review_categories, only: %i[create destroy]
    end

    resources :contacts, only: %i[new create] do
      collection do
        post 'confirm'
        get 'thanks'
      end
    end

    get 'search' => 'searches#search'

    resources :ranks, only: [:index]
  end

  namespace :admin do
    root to: 'homes#top'
    resources :reviews, only: %i[index show destroy]
    resources :comments, only: [:destroy]
    resources :ranks, only: %i[index create update]
    resources :end_users, only: %i[index show edit update destroy]
    resources :contacts, only: %i[index show]
    resources :review_categories, only: [:index]
    resources :media, only: %i[create destroy]
    resources :features, only: %i[create destroy]
    resources :genres, only: %i[create destroy]
  end
end
