Rails.application.routes.draw do

  #顧客用
   devise_for :customers,skip: [:passwords], controllers: {
    registrations: "customer/registrations",
    sessions: "customer/sessions"
  }

  namespace :customer do
    resources :customers, only: [:show, :edit, :update]
    patch 'customers/quit' => 'customers#quit', as: 'quit'
    resources :games, only: [:index, :show, :new, :create] do
      resources :reviews, only: [:new, :show, :edit, :create, :update, :destroy] do
        resources :comments, only: [:new, :create, :destroy]
        resource :bookmarks, only: [:index, :create, :destroy]
        resource :favorites, only: [:create, :destroy]
      end
    end
    get "search" => "searches#search"
  end
  root to: "customer/homes#top"


  #管理者用
  devise_for :admins,skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  namespace :admin do
    resources :customers, only: [:index, :show, :edit, :update]
    resources :platforms, only: [:index, :edit, :create, :update, :destroy]
    resources :genres, only: [:index, :edit, :create, :update, :destroy]
    resources :target_ages, only: [:index, :edit, :create, :update, :destroy]
    resources :games, only: [:index, :new, :show, :edit, :update, :destroy, :create]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
