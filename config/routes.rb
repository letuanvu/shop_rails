Rails.application.routes.draw do
  get 'dashboard' => 'dashboard#index'
  get 'account/list' => 'account_manager#index'
  post 'account/list' => 'account_manager#index'
  get 'product/list' => 'product#index'
  get 'order/list' => 'order#index'
  get 'order/updateStatus/:id',to: 'order#changeStatus', as: 'change_status_order'
  get 'account/getdetailaccount' => 'account_manager#getDetailAccount'
  get 'order/getdetailorder' => 'order#getDetailOrder'
  get 'shop', to: 'front#index', as: 'shop'
  post 'shop/getCart' => 'front#getCart'
  get 'shop/cart',to: 'front#cart', as: 'cart'
  get 'shop/information', to: 'front#information', as: 'information'
  post 'shop/information', to: 'front#create'
  patch 'shop/information', to: 'front#update'
  post 'shop/createorder', to: 'front#createorder'
  get 'shop/my_order', to: 'front#my_order', as: 'shop_order'
  get 'front/updateStatus/:id',to: 'front#changeStatus', as: 'change_status_order_cus'


  root :to => "front#index"
  # root :to => "dashboard#index"
  resources :account_manager
  resources :product
  resources :front
  devise_for :accounts,
     # path: 'auth',
     path: 'auth',
     controllers: {
         sessions: 'accounts/sessions',
         passwords: 'accounts/passwords',
         registrations: 'accounts/registrations'
     },
     path_names: {
         sign_in: 'login',
         sign_out: 'logout',
         password: 'secret',
         confirmation: 'verification',
         unlock: 'unblock',
         registration: 'register',
         sign_up: 'cmon_let_me_in'
     }
  # root :to => "accounts#sessions_controller", :id => '1'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
