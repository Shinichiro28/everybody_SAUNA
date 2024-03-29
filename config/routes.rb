Rails.application.routes.draw do

  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions",
  }

  devise_for :saunners, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions',
  }

  devise_scope :saunner do
    post 'saunners/guest_sign_in', to: 'public/saunners/sessions#guest_sign_in'
  end

  scope module: :public do
    root to: "homes#top"
    get "/about" => "homes#about", as: "about"
    get "/saunners/my_page" => "saunners#show", as: "my_page"
    get "/saunners/edit" => "saunners#edit", as: "edit_saunners"
    patch "saunners" => "saunners#update"
    # いいね一覧
    get "/saunners/favorites" => "saunners#favorites", as: "favorites"
    # 退会確認画面
    get "/saunners/unsubscribe" => "saunners#unsubscribe", as: "unsubscribe"
    # 論理削除用のルーティング
    patch "/saunners/withdrawal" => "saunners#withdrawal", as: "withdrawal"

    resources :saunas do
      resources :posts do
        resource :favorites, only: [:create, :destroy]
        resources :comments, only: [:create, :destroy]
        get "search_tag" => "posts#search_tag"
      end
    end

    resources :chat_groups do
      get "join" => "chat_groups#join"
      delete "all_destroy" => 'chat_groups#all_destroy'
      resources :chats, only: [:create, :destroy]
    end

    resources :notifications, only: [:index]

    get "/search" => "searches#search", as: "search"

    resources :contacts, only: [:new, :create]

    resources :products, only: [:index, :show]
    resources :cart_products, expect: [:new, :show, :edit] do
      delete "/cart_products/destroy_all" => "cart_products#destroy_all", as: "destroy_all"
    end
    post "/orders/confirm" => "orders#confirm", as: "confirm"
    get "/orders/complete" => "orders#complete", as: "complete"
    resources :orders, expect: [:edit, :update, :destroy]
    resources :shipping_addresses, expect: [:new, :show]
  end

  namespace :admin do
    resources :saunners, expect: [:new, :create, :destroy]
    resources :saunas, expect: [:new, :create]
    resources :posts, only: [:index, :show, :destroy]
    resources :comments, only: [:index, :show, :destroy]
    resources :contacts, only: [:index, :show]
    resources :products
    resources :genres, expect: [:new, :show]
    resources :orders, only: [:show, :index, :update]
    resources :order_products, only: [:update]
    resources :chat_groups, only: [:show, :index] do
      delete "all_destroy" => 'admin/chat_groups#all_destroy'
    end
    root "homes#top"
  end

  get "/admin" => "admin/homes#top", as: "admin"
  get "/admin/search" => "admin/searches#search"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
