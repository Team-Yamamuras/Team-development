Rails.application.routes.draw do

  get 'cart_items/index'
  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  #会員側のルーティング設定
  root "homes#top"
  get "/home/about" => "homes#about", as: "about"
  scope module: :public do
    resources :orders, only: [:new, :create, :index, :show]
    resources :items,only: [:index,:show]
    resources :shipping_addresses,only: [:index, :edit, :create, :update, :destroy]
    #マイページidを含まないルーティング
    get 'customers/infomation/edit' => 'customers#edit'
    patch 'customers/infomation' => 'customers#update'
    get 'customers' => 'customers#show'
    get 'customers/quit' => 'customers#quit'
    patch 'customers/out' => 'customers#out'
  end
  #管理者側のルーティング設定
  namespace :admin do
    root 'homes#top'
    resources :items,only: [:new,:index,:show,:edit,:update]
    resources :categories,only: [:index,:create,:edit,:update]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
