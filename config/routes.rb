ActionController::Routing::Routes.draw do |map|

  map.register 'register', :controller => 'users', :action => 'new'
  map.login 'login', :controller => 'user_sessions', :action => 'new'  
  map.logout 'logout', :controller => 'user_sessions', :action => 'destroy'  
  map.search '/search', :controller => :searches
  map.results '/search/results', :controller => :searches, :action => :results
  
  map.add_registered_artists '/offerings/add_registered_artist', :controller => 'offerings', :action => 'add_registered_artist'
  map.change_regions'/offerings/change_region', :controller => 'offerings', :action => 'change_region'
  map.unvalidated_offerings 'offerings/unvalidated_offerings', :controller => 'offerings', :action => 'unvalidated_offerings'
  
   map.namespace :search do |search|
    search.location "/location", :controller => "location"
    search.user "/user/autocomplete", :controller => "searches", :action => "users"
  end
  
  map.who_we_are "/who", :controller => 'statics', :action => "who_we_are"
  map.advertising "/advertising", :controller => 'statics', :action => "advertising"
  map.who_we_are "/contact", :controller => 'statics', :action => "contact"


  map.resources :user_sessions  
  map.resources :plans
  map.resources :regions
  map.resources :offerings
  map.resources :contacts
  map.resources :instructors
  map.resources :topics
  map.resources :types
  map.resources :locations
  map.resources :users
  
  map.root :controller => 'statics', :action => 'home'

  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
