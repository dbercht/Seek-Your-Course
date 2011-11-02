SeekYourCourse::Application.routes.draw do

  
  resources :offerings

  match 'pending_offerings', :to => 'offerings#pending_index', :as => 'pending_offerings'
  match 'manage_home', :to => 'users#manage_home', :as => "manage_home"
  resources :plans
  resources :topics 
  resources :types

  resources :regions do
    resources :locations
  end

  match 'user/edit' => 'users#edit', :as => :edit_current_user
  match 'signup' => 'users#new', :as => :signup
  match 'logout' => 'user_sessions#destroy', :as => :logout
  match 'login' => 'user_sessions#new', :as => :login
	
	match "recover_password" => "recover_password#new", :via => :get, :as => 'recover_password'
  match "recover_password" => "recover_password#create", :via => :post


  resource :profiles

  resources :user_sessions
  resources :users

  match 'ads' => 'ads#create', :via => :post
  match "ads" => "static#ads", :as => 'ads_index'
	resources :ads, :except => [:show]
  match 'ads/:id' => "ads#show"


  match "about" => "static#about", :as => 'about_index'
  match "contact" => "static#contact", :as => 'contact'


  match "admin_ads" => "ads#index", :as => "ads"

  root :to => "static#home"

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
