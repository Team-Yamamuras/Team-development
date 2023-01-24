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
    post "/orders/confirm" => "orders#confirm", as: "orders_confirm" #購入確認画面への遷移
    get "/orders/complete" => "orders#complete", as: "orders_complete" #購入完了お礼メッセ画面への遷移
    #マイページidを含まないルーティング
    get 'customers/infomation/edit' => 'customers#edit'
    #inomation追加
    patch 'customers/infomation' => 'customers#update'
    get 'customers' => 'customers#show'
    get 'customers/quit' => 'customers#quit'
    patch 'customers/out' => 'customers#out'
    resources :orders, only: [:new, :create, :index, :show]
    resources :items,only: [:index,:show]
    resources :shipping_addresses,only: [:index, :edit, :create, :update, :destroy]
  end
  #管理者側のルーティング設定
  namespace :admin do
    root 'homes#top'
    resources :items,only: [:new,:index,:show,:edit,:update]
    resources :categories,only: [:index,:create,:edit,:update]
    resources :customers,only: [:index,:show,:edit,:update]
    resources :orders,only: [:index,:show,:update]
    resources :ordered_itemes,only: [:update]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end