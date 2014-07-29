Rails.application.routes.draw do

  ### Quests ###
  get '/users/quests', to: "quests#index"
  get '/quests', to: "quests#main"
  get '/accept', to: "quests#accept_form"
  post '/create', to: "quests#create"
  post '/accept', to: "quests#accept"
  post '/set_location', to: "quests#set_location"
  post 'commit_location', to: "quests#commit_location"

  ### Quest JSON ###
  get '/quests/all', to: "quests#all"
  get '/user_accepted_quests_loc', to: "quests#user_accepted_quests_loc"
  get '/user_created_quests_loc', to: "quests#user_created_quests_loc"
  get '/user_completed_quests_loc', to: "quests#user_completed_quests_loc"

  ### User JSON ###
  get '/user_all_checkins_loc', to: "users#user_all_checkins_loc"
  get '/users/checkins', to: "users#checkin_points"




  ### FourSquare ###
  get '/foursquare', to: "foursquare#index", as: 'foursquare'
  get '/redirect', to: "foursquare#redirect"
  #get '/map', to: "foursquare#map", as: "map"
  post '/pull', to: "foursquare#pull", as: 'pull'

  #### Users ###
  get '/logout', to: "users#logout", as: 'logout'
  get '/users/profile', to: "users#profile"
  get '/admin-checkin', to: "users#admin_checkin"
  get '/test_login', to: "users#test_login"

  ### Maps ###
  get '/map', to: "maps#show"





  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"

  root "users#index"


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
