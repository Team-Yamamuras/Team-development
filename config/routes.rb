Rails.application.routes.draw do

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
  resources :items,only: [:index,:show]
　#会員側マイページ
  get 'customers/infomation/edit' => 'customers#edit'
  patch 'customers' => 'customers#update'
  get 'customers' => 'customers#show'
  get 'customers/infomation/quit' => 'customers#quit'
  patch 'customers/out' => 'customers#out'

  #管理者側のルーティング設定
  namespace :admin do
    root 'homes#top'
    resources :items,only: [:new,:index,:show,:edit,:update]
    resources :categories,only: [:index,:create,:edit,:update]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
