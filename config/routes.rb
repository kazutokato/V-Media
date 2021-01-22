Rails.application.routes.draw do
  devise_for :admins
  devise_for :end_users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  scope module: :public do
    root to: 'homes#top'
    get 'about' => 'homes#about'
    get 'top' => 'manuals#top'
    resources :end_users, only: [:show, :edit, :update] do
      member do
        get 'unsubscribe'
        patch 'withdraw'
        get 'thanks'
      end
    end

    resources :reviews do
      resources :comments, only: [:create, :destroy]
      resource :favorites, only: [:create, :destroy]
      resources :rates, only: [:create, :update]
    end

    resources :contacts, only: [:new, :create] do
      collection do
        post 'confirm'
        get 'thanks'
      end
    end
  end

  namespace :admin do
    root to: 'homes#top'
    resources :reviews, only: [:index, :show, :destroy]
    resources :comments, only: [:destroy]
    resources :ranks, only: [:index, :create, :update]
    resources :end_users, only: [:index, :show, :edit, :update, :destroy]
    resources :contacts, only: [:index, :show]
    resources :categories, only: [:index, :create, :destroy]
  end

end
