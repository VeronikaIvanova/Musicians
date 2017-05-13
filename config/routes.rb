Rails.application.routes.draw do
  resources :roles
  resources :groups
  resources :resumes
  resources :instruments
 
  resources :genres
  resources :genders
  resources :instruments

  resources :chats do
    resources :messages, :only=>[:new, :create]
  end

  devise_for :users

  resources :messages, only: [:destroy]
  resources :instrumentalist_to_groups, only: [:destroy]
  resources :user_to_groups, only: [:destroy]

  resources :groups do
    resources :instrumentalist_to_groups, :only=>[:new, :create]
    resources :user_to_groups, :only=>[:new, :create]
  end
 
  get 'instrument/user/:user_id', to: 'application#instruments'	
  get 'cities/:states', to: 'application#cities'
  get 'states/:countries', to: 'application#states'
  get 'countries', to: 'application#countries'
  root 'static#index'
  post "/chats/:chat_id/messages" => "messages#create"
  post "/groups/:group_id/instrumentalist_to_groups" => "instrumentalist_to_groups#create"
  post "/groups/:group_id/user_to_groups" => "user_to_groups#create"
  match '/users/:id', to: 'users#show' ,  via: 'get'
  match '/users/',    to: 'users#index',  via: 'get'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  #root 'welcome#index'

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
