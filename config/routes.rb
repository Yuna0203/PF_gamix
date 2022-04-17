Rails.application.routes.draw do

  #顧客用
   devise_for :customers,skip: [:passwords], controllers: {
    registrations: "customer/registrations",
    sessions: "customer/sessions"
  }

  namespace :customer do
    resources :bookmarks, only: [:index]
    resources :customers, only: [:show, :quit, :edit, :update]
    resources :comments, only: [:new, :edit]
    resources :games, only: [:index, :show, :new, :create] do
      resources :reviews, only: [:new, :show, :edit, :create]
    end
    resources :searches, only: [:search]
  end
  root to: "customer/homes#top"


  #管理者用
  devise_for :admins,skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  namespace :admin do
    resources :customers, only: [:index, :show, :edit]
    resources :platforms, only: [:index, :edit, :create, :update, :destroy]
    resources :genres, only: [:index, :edit, :create, :update, :destroy]
    resources :target_ages, only: [:index, :edit, :create, :update, :destroy]
    resources :games, only: [:index, :new, :show, :edit]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
