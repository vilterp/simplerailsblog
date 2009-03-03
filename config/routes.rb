ActionController::Routing::Routes.draw do |map|
  map.root :controller => 'posts'
  map.resources :posts, :has_many => :comments
  # restful authentication
  map.resources :users
  map.resource :session
  map.signup '/signup', :controller => 'users', :action => 'new'
  map.login '/login', :controller => 'sessions', :action => 'new'
  map.logout '/logout', :controller => 'sessions', :action => 'destroy'
end
