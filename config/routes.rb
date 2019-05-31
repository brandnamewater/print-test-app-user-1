Rails.application.routes.draw do



  resources :fulfillments

  resources :orders

  resources :store_products

  resources :products

  resources :line_items
  resources :carts
  resources :users
  resources :user_sessions, only: [:new, :create, :destroy]

  get "signup_user", to: "users#new", as: "signup_user"
  get "login_user", to: "user_sessions#new", as: "login_user"
  get "logout_user" => "user_sessions#destroy", as: "logout_user"

  # resources :carts do
  #   resources: :orders
  # end

  # resources :orders do
  #   resources :fulfillments
  # end

  mount ShopifyApp::Engine, at: '/'
  get 'fulfillment/fulfil_order'
  get 'fulfillment/fulfill_order_2'
  post 'fulfillment/fulfill_order_2'

  get 'modal' => "home#modal", :as => :modal
  get 'modal_buttons' => "home#modal_buttons", :as => :modal_buttons
  get 'regular_app_page' => "home#regular_app_page"
  get 'help' => "home#help"
  get 'pagination' => "home#pagination"
  get 'breadcrumbs' => "home#breadcrumbs"
  get 'buttons' => "home#buttons"
  get 'form_page' => "home#form_page"
  post 'form_page' => "home#form_page"
  get 'error' => 'home#error'
  get 'orders' => "home#orders"
  get 'order_old' => "home#order_old"
  get 'fulfill' => "fulfillment#fulfill"


  controller :sessions do
      get 'login' => :new, :as => :login
      post 'login' => :create, :as => :authenticate
      get 'auth/shopify/callback' => :callback
      get 'logout' => :destroy, :as => :logout
  end

  # get 'user_sessions/new'
  # get 'user_sessions/create'
  # get 'user_sessions/destroy'
  # get 'sessions/new'
  # get 'sessions/create'
  # get 'sessions/destroy'
  # resources :users

  root :to => 'home#index'


  # resources :fulfillments
  #
  # resources :orders
  #
  # resources :store_products
  #
  # resources :products

end
