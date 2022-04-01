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
    resources :customers, only: [:edit, :update]
  end
  scope module: 'public' do
    resources :items, only: [:index, :show]
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

end
