Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root 'homes#index'
  resources 'comment_on_products'

  resources 'wishlists' 
  
  resources 'orders'
  resources 'orders' do
    member do
      get 'show' 
    end
  end

  resources 'addresses'
  resources'carts' do
    collection do
      post 'apply_coupon'
      post 'create_cart_address'
      get 'destroy_coupon'
    end
  end

    resources'carts' do
    member do
      post 'add_to_cart'
      patch 'update_cart_address'
      delete 'destroy_cart_address'
    end
  end

  resources'homes' do
    get "product_details", on: :member
    post "like_product", on: :member
    get "dislike_product", on: :member
    collection do
      get 'category_search' 
      get 'product_search'
    end
  end

  resources :homes, only: [:index, :show]
  devise_for :users
  resources :authors do
    resources :books  
  end

  resources :articles do
    resources :comments
  end

  resources 'physicians' do 
    member do
      get 'see'
    end
  end

  resources 'patients' do 
    member do
      get 'see'
    end
  end

  resources 'appointments' do
    member do
      post 'upload_files'
      get 'download_prescription'
      get 'download_test_report'
    end
  end
  
  resources :students
  resources :physicians
  resources :patients
  resources :appointments
  resources :cart_items

  namespace :api, constraints: { format: :json } do
    namespace :v1, constraints: { format: :json } do
      devise_for :users, controllers: {
        sessions: 'api/v1/users/sessions',
        registrations: 'api/v1/users/registrations'
      },path: '', path_names: {
        sign_in: 'login',
        sign_out: 'logout',
        registration: 'signup'
        }
    end
  end

  namespace :api, constraints: { format: :json } do
    namespace :v1, constraints: { format: :json } do
      resources :homes, only: [:index, :show] do
        post "like_product", on: :member
        get "dislike_product", on: :member
        get 'category_search', on: :collection
        collection do
          get 'product_search'
        end
      end
      resources 'wishlists' 
      resources'carts' do
        collection do
          post 'apply_coupon'
          post 'create_cart_address'
          get 'destroy_coupon'
        end
        member do
          post 'add_to_cart'
          patch 'update_cart_address'
          delete 'destroy_cart_address'
        end
      end
      #resources 'orders'
      resources 'orders'
      resources 'cart_items'
      resources 'comment_on_products'
    end
  end
  
end
