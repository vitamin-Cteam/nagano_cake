Rails.application.routes.draw do


  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  scope module: :public do
    root to: "homes#top"
    get "/about" => "homes#about", as: "about"

    resources :items, only: [:index, :show]
    resource :customers, only: [:show, :update] #:idを持たせないためresouce
    get "/customers/information/edit" => "customers#edit"
    get "/customers/confirm" => "customers#confirm"
    patch "/customers/withdraw" => "customers#withdraw"
    delete "/cart_items/destroy_all" => "cart_items#destroy_all"
    resources :cart_items, only: [:index, :create, :update, :destroy]
    post "/orders/confirm" => "orders#confirm"
    get "/orders/confirm" => "orders#error"
    get "/orders/complete" => "orders#complete"
    resources :orders, only: [:new, :create, :index, :show]
    resources :addresses, only: [:index, :edit, :create, :update, :destroy]
  end

  namespace :admin do
    root to: "homes#top"
    resources :items, only: [:index, :new, :show, :edit, :create, :update]
    resources :genres, only: [:index, :edit, :create, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orders, only: [:index, :show, :update]
    patch "/admin/order_details/:id" => "order_details#update" ,as: "order_details"
  end
  # 顧客用
  # URL /customers/sign_in ...
  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
