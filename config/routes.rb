ActionController::Routing::Routes.draw do |map|
  map.resources :offerings
  map.resources :contacts
  map.resources :instructors
  map.resources :topics
  map.resources :types
  map.resource :search
  map.namespace :search do |search|
    search.location "/location", :controller => "location"
  end

  map.root :controller => 'statics', :action => 'home'

  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
