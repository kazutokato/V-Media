Rails.application.routes.draw do

  devise_for :end_users, controllers: {
    registrations: 'end_users/registrations',
    sessions: 'end_users/sessions'
  }

  devise_scope :end_user do #ゲストログイン機能に関するルーティング
    post 'end_users/guest_sign_in', to: 'end_users/sessions#new_guest'
  end

  devise_for :admins, controllers: {
    sessions: 'admins/sessions'
  }

  scope module: :public do
    root to: 'homes#top'
    resources :end_users, only: [:show, :edit, :update] do
      member do
        patch 'withdraw'
      end
    end

    resources :reviews do
      get :search, on: :collection
      resources :comments, only: [:create, :destroy]
      resource :favorites, only: [:create, :destroy]
      resources :review_categories, only: [:create, :destroy]
    end

    resources :contacts, only: [:new, :create] do
      collection do
        post 'confirm'
      end
    end
  end

  namespace :admin do
    root to: 'homes#top'
    get 'search/search'
    resources :reviews, only: [:index, :show, :destroy]
    resources :comments, only: [:destroy]
    resources :end_users, only: [:index, :show, :edit, :update, :destroy]
    resources :contacts, only: [:index, :show]
    resources :review_categories, only: [:index]
    resources :media, only: [:create, :destroy]
    resources :features, only: [:create, :destroy]
    resources :genres, only: [:create, :destroy]
  end

end
