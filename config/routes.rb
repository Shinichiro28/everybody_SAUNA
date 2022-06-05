Rails.application.routes.draw do

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

  devise_for :saunners,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}


  root to: "public/homes#top"
  get "/about" => "public/homes#about", as: "about"

  get "/saunners/my_page" => "public/saunners#show", as: "my_page"
  get "/saunners/edit" => "public/saunners#edit", as: "edit_saunners"
  patch "saunners" => "public/saunners#update"
  get "/saunners/unsubscribe" => "public/saunners#unsubscribe", as: "unsubscribe"
  patch "/saunners/withdrawal" => "public/saunners#withdrawal", as: "withdrawal"

  resources :saunas, controller: "public/saunas"
  resources :posts, controller: "public/posts"
  resources :favorites, only:[:create,:destroy], controller: "public/favorites"
  resources :comments, only:[:create,:destroy], controller: "public/comments"
  resources :chats, only:[:index], controller: "public/chats"
  resources :chat_groups, expect:[:edit,:update], controller: "public/chat_groups"


  namespace :admin do
    resources :saunners, expect:[:new,:create,:destroy]
    resources :saunas, expect:[:new,:create]
    resources :posts, only:[:index,:show,:destroy]
    resources :comments, only:[:index,:show,:destroy]
  end

  get "/admin" => "admin/homes#top", as: "admin"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
