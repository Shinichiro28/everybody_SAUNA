Rails.application.routes.draw do

  root to: "public/homes#top"
  get "/about" => "public/homes#about", as: "about"

  get "/saunners/my_page" => "public/saunners#show", as: "my_page"
  get "/saunners/edit" => "public/saunners#edit", as: "edit_saunners"
  patch "saunners" => "public/saunners#update"
   #退会確認画面
  get "/saunners/unsubscribe" => "public/saunners#unsubscribe", as: "unsubscribe"
   #論理削除用のルーティング
  patch "/saunners/withdrawal" => "public/saunners#withdrawal", as: "withdrawal"


  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

  devise_for :saunners,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

  devise_scope :saunner do
    post 'saunners/guest_sign_in', to: 'public/saunners/sessions#guest_sign_in'
  end


  resources :saunas, controller: "public/saunas" do
    resources :posts, controller: "public/posts" do
      resource :favorites, only:[:create, :destroy], controller: "public/favorites"
      resources :comments, only:[:create,:destroy], controller: "public/comments"
      get "search_tag"=>"publics/posts#search_tag"
    end
  end

  resources :posts, only:[:index], controller: "public/posts" do
    resource :favorites, only:[:create,:destroy], controller: "public/favorites"
    resources :comments, only:[:create,:destroy], controller: "public/comments"
  end

  resources :chat_groups, controller: "public/chat_groups" do
    get "join" => "public/chat_groups#join"
    delete "all_destroy" => 'public/chat_groups#all_destroy'
    resources :chats, only:[:show,:create,:destroy], controller: "public/chats"
  end

  resources :notifications, only:[:index]

  get "/public/search" => "public/searches#search", as: "search"

  namespace :admin do
    resources :saunners, expect:[:new,:create,:destroy]
    resources :saunas, expect:[:new,:create]
    resources :posts, only:[:index,:show,:destroy]
    resources :comments, only:[:index,:show,:destroy]
    resources :chat_groups, expect:[:new, :create] do
      delete "all_destroy" => 'admin/chat_groups#all_destroy'
    end
    root "homes#top"
  end

  get "/admin" => "admin/homes#top", as: "admin"
  get "/admin/search" => "admin/searches#search"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
