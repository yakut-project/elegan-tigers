OSS::Application.routes.draw do
  get "frontend/index"
  get "frontend/teachersindex"
  get "frontend/usersindex"
  devise_for :teachers do
    get "teachers/login" ,:to =>"devise/sessions#new"
    get "teachers/logout", :to =>"devise/sessions#destroy"
  end

  devise_for :admins, controllers: {sessions: 'hq/sessions'}, path: 'hq',
             path_names: {sign_in: 'login', sign_out: 'logout', password: 'secret',
                          confirmation: 'verification'}
  devise_for :users do
    get "user/login", :to => "devise/sessions#new" # Add a custom sign in route for user sign in
    get "user/logout", :to => "devise/sessions#destroy"
  end

  root to: 'frontend#index'
  namespace :hq do
      resources :dashboard, only: [:index]
  end

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
