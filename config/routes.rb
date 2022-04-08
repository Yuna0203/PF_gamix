Rails.application.routes.draw do
  namespace :admin do
    get 'customers/index'
    get 'customers/show'
    get 'customers/edit'
  end
  namespace :admin do
    get 'platform/index'
    get 'platform/edit'
  end
  namespace :admin do
    get 'genres/index'
    get 'genres/edit'
  end
  namespace :admin do
    get 'games/index'
    get 'games/new'
    get 'games/show'
    get 'games/edit'
  end
  namespace :customer do
    get 'bookmark/index'
  end
  namespace :customer do
    get 'customers/show'
    get 'customers/quit'
    get 'customers/edit'
  end
  namespace :customer do
    get 'comments/new'
    get 'comments/edit'
  end
  namespace :customer do
    get 'reviews/new'
    get 'reviews/show'
    get 'reviews/edit'
  end
  namespace :customer do
    get 'homes/top'
  end
  namespace :customer do
    get 'games/index'
    get 'games/show'
    get 'games/new'
  end
  #顧客用
  namespace :customer do
    
  end
  
  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "customer/registrations",
    sessions: "customer/sessions"
  }

  #管理者用
  devise_for :admins,skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  
  namespace :admin do
    
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
