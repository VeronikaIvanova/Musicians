Rails.application.routes.draw do
  resources :states
  resources :cities
  resources :countries
  resources :statuses
  resources :concerts
  resources :conserts
  resources :roles
  resources :groups
  resources :resumes
  resources :instruments
  resources :vacancies
  resources :genres
  resources :genders
  resources :instruments
  resources :user_notes, only: [:create, :destroy]
  resources :group_notes, only: [:destroy]
  devise_for :users
  resources :users, only: [:index]

  resources :users do
    resources :friends, :only=>[:new, :create]
  end

  resources :groups do
    resources :instrumentalist_to_groups, :only=>[:new, :create]
    resources :user_to_groups, :only=>[:new, :create]
    resources :vacancies, :only=>[:new, :create]
    resources :group_notes, :only=>[:new, :create]
  end

  resources :concerts do
    resources :concert_followers, :only=>[:new, :create]
    resources :concert_participants, :only=>[:new, :create]
    resources :concert_notes, :only=>[:new, :create]
  end

  resources :chats do
    resources :messages, :only=>[:new, :create]
  end

  resources :vacancies do
    resources :answers, :only=>[:new, :create]
  end

  resources :concert_followers, only: [:destroy]
  resources :concert_participants, only: [:destroy]
  resources :concert_notes, only: [:destroy]
  resources :friends, only: [:destroy]
  resources :messages, only: [:destroy]
  resources :instrumentalist_to_groups, only: [:destroy]
  resources :user_to_groups, only: [:destroy]
  resources :answers, only: [:destroy]

  get '/groups/:id/write', to: 'groups#write_message'
  get '/users/:id/write', to: 'users#write_message'
  get '/instrument/user/:user_id', to: 'application#instruments'	
  get '/get/cities/:id', to: 'application#cities'
  get '/get/states/:id', to: 'application#states'
  get 'countries', to: 'application#countries'
  root 'static#index'

  get '/concerts/:concert_id/group/:group_id' => "request_groups#add"
  get '/request/:id' => "friends#add"
  post "/chats/:chat_id/messages" => "messages#create"
  post "/groups/:group_id/instrumentalist_to_groups" => "instrumentalist_to_groups#create"
  post "/groups/:group_id/user_to_groups" => "user_to_groups#create"
  match '/users/:id', to: 'users#show' ,  via: 'get'

  get '/user_friends/' => "sidebars#friends"
  get '/user_groups/' => "sidebars#groups"
  get '/user_concerts/' => "sidebars#concerts"
  get '/feeds/' => "sidebars#feeds"

  get '/user_friends/requests' => "sidebars#friends_requests"
  get '/user_groups/admins' => "sidebars#groups_admins"
  get '/user_concerts/admins' => "sidebars#concerts_admins"
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
