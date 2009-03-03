ActionController::Routing::Routes.draw do |map|
  map.root :controller => 'posts'
  map.resources :users
  map.resource :session
  map.resources :posts, :has_many => :comments
  # restful authentication
  map.activate '/activate/:activation_code', :controller => 'users', :action => 'activate', :activation_code => nil
  map.signup '/signup', :controller => 'users', :action => 'new'
  map.login '/login', :controller => 'sessions', :action => 'new'
  map.logout '/logout', :controller => 'sessions', :action => 'destroy'
end
