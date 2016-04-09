Rails.application.routes.draw do

  get 'map/show'

  devise_for :farms#, :controllers => { registrations: 'farm_registrations' }
  devise_for :restaurants#, :controllers => { registrations: 'restaurant_registrations' }


  authenticated :farm do
    root "farms#index", as: :farm_root
    get "/" => "farms#index"
  end

  authenticated :restaurant do
    root "restaurants#index", as: :restaurant_root
    get "/" => "restaurants#index"
  end

  root "application#index"

  resources :categories, only: [:index]
  resources :items, only: [:index, :create, :show, :update, :destroy, :new, :edit]
  resources :baskets, only: [:index]

  get "/inventory" => "items#farm_index", as: :farm_items
  get "/product/:id" => "items#product", as: :product
  get "/map" => "maps#index", as: :map


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
