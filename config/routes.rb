ActionController::Routing::Routes.draw do |map|
  map.resources :plans

  map.resources :regions

  map.resources :offerings
  map.resources :contacts
  map.resources :instructors
  map.resources :topics
  map.resources :types
  map.resources :locations
  
  map.search '/search', :controller => :searches
  map.results '/search/results', :controller => :searches, :action => :results
  
   map.namespace :search do |search|
    search.location "/location", :controller => "location"
  end
  
  map.who_we_are "/who", :controller => 'statics', :action => "who_we_are"
  map.advertising "/advertising", :controller => 'statics', :action => "advertising"
  map.who_we_are "/contact", :controller => 'statics', :action => "contact"

  map.root :controller => 'statics', :action => 'home'

  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
