Rails.application.routes.draw do
  # 顧客用
  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  scope module: 'public' do
    root to: 'homes#top'
    get 'about' => 'homes#about'
  end
  scope module: 'public' do
    get 'customers/mypage' => 'customers#show'
    resources :customers, only: [:edit, :update] do
      collection do
        get 'bookmark' => 'bookmarks#bookmark'
      end
    end
  end
  scope module: 'public' do
    resources :items, only: [:index, :show] do
      collection do
        get 'result'
      end
      get 'reviews/thanks' => 'reviews#thanks'
      resources :reviews, only: [:new, :create]
      resource :bookmarks, only: [:create, :destroy]

    end
  end
  scope module: 'public' do
    delete 'cart_items/destroy_all' => 'cart_items#destroy_all'
    resources :cart_items, only: [:index, :create, :update, :destroy]
  end
  scope module: 'public' do
    post 'orders/confirm' => 'orders#confirm'
    get 'orders/thanks' => 'orders#thanks'
    resources :orders, only: [:new, :create, :index, :show]
  end

  # 管理者用
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  namespace :admin do
    get '/' => 'homes#top'
  end
  namespace :admin do
    resources :genres, only: [:index, :create, :edit, :update]
  end
  namespace :admin do
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
  end
  namespace :admin do
    resources :customers, only: [:index, :show]
  end
  namespace :admin do
    resources :orders, only: [:index, :show]
  end

end
