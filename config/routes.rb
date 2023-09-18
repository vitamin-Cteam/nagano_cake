Rails.application.routes.draw do
  namespace :admin do
    get 'orders/show'
  end
  namespace :admin do
    get 'customers/index'
    get 'customers/edit'
    get 'customers/show'
  end
  namespace :admin do
    get 'genres/index'
    get 'genres/edit'
  end
  namespace :admin do
    get 'items/index'
    get 'items/new'
    get 'items/show'
    get 'items/edit'
  end
  namespace :admin do
    get 'homes/top'
  end
  namespace :public do
    get 'addresses/index'
    get 'addresses/edit'
  end
  namespace :public do
    get 'orders/new'
    get 'orders/confirm'
    get 'orders/complete'
    get 'orders/index'
    get 'orders/show'
  end
  namespace :public do
    get 'cart_items/index'
  end
  namespace :public do
    get 'customers/show'
    get 'customers/edit'
    get 'customers/confirm'
  end
  namespace :public do
    get 'items/index'
    get 'items/show'
  end
  namespace :public do
    get 'homes/top'
    get 'homes/about'
  end
  devise_for :customers
  devise_for :admins

  scope module: :public do
    root to: "homes#top"
    get "/about" => "homes#about", as: "about"

    resources :items, only: [:index, :show]
    resource :customers, only: [:show, :update] #:idを持たせないためresouce
    get "/customers/information/edit" => "customers#edit"
    get "/customers/comfirm" => "customers#comfirm"
    patch "/customers/withdraw" => "customers#withdraw"
    resources :cart_items, only: [:index, :create, :update, :destroy]
    delete "/cart_items/destroy_all" => "cart_items#destroy_all"
    resources :orders, only: [:index, :new, :show, :create]
    post "/orders/comfirm" => "orders#comfirm"
    get "/orders/complete" => "orders#complete"
    resources :addresses, only: [:index, :edit, :create, :update, :destroy]
  end

  namespace :admin do
    root to: "homes#top"
    resources :items, only: [:index, :new, :show, :edit, :create, :update]
    resources :genres, only: [:index, :edit, :create, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orders, only: [:show, :update]
    patch "/admin/order_details/:id" => "order_details#update" ,as: "order_details"
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
