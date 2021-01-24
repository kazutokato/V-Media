Rails.application.routes.draw do
  devise_for :end_users, controllers: {
    registrations: 'end_users/registrations',
    sessions: 'end_users/sessions'
  }
  devise_for :admins, controllers: {
    sessions: 'admins/sessions'
  }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  scope module: :public do
    root to: 'homes#top'
    get 'about' => 'homes#about'
    post '/homes/guest_sign_in', to: 'homes#new_guest'
    get 'top' => 'manuals#top'
    resources :end_users, only: [:show, :edit, :update] do
      member do
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
    resources :categories, only: [:index, :edit, :update, :create, :destroy]
  end

end
