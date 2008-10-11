ActionController::Routing::Routes.draw do |map|
  map.resources :groups

  
  map.resources :groups

  map.resources :locations

  map.resources :items

  map.resources :users

  map.resource :session

  map.resources :users do |users|
    users.resources :items, :name_prefix => 'user_'
  end
  
  map.resources :locations do |locations|
    locations.resources :users, :name_prefix => 'location_'
    locations.resources :items, :name_prefix => 'location_'
  end
  
  map.resources :items do |items|
    items.resources :users, :name_prefix => 'item_'
  end
  
  map.root :controller => 'page'
  map.home '/', :controller => 'page', :action => 'index'
  map.faq  '/faq', :controller => 'page', :action => 'faq'
  map.howitworks '/howitworks', :controller => 'page', :action => 'howitworks'
  map.account '/account', :controller => 'users', :action => 'index'
  
  map.activate '/activate/:activation_code', :controller => 'users', :action => 'activate'
  map.signup '/signup', :controller => 'users', :action => 'new'
  map.login '/login', :controller => 'sessions', :action => 'new'
  map.logout '/logout', :controller => 'sessions', :action => 'destroy'
  
  # The priority is based upon order of creation: first created -> highest priority.

  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :products

  # Sample resource route with options:
  #   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

  # Sample resource route with sub-resources:
  #   map.resources :products, :has_many => [ :comments, :sales ], :has_one => :seller
  
  # Sample resource route with more complex sub-resources
  #   map.resources :products do |products|
  #     products.resources :comments
  #     products.resources :sales, :collection => { :recent => :get }
  #   end

  # Sample resource route within a namespace:
  #   map.namespace :admin do |admin|
  #     # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
  #     admin.resources :products
  #   end

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
  # map.root :controller => "welcome"

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end