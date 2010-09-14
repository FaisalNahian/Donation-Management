ActionController::Routing::Routes.draw do |map|
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
  map.namespace :admin do |admin|
  #   Directs /admin/users/* to Admin::UsersController (app/controllers/admin/users_controller.rb)
    admin.resources :users, :member => { :deactivate => :put }
    admin.resources :partners
    admin.resources :pages, :member => { :deactivate => :put }
    admin.resources :account
    admin.resources :settings
  end
  map.admin "/admin", :controller => '/admin/dashboard', :action => 'index'

  map.resource :admin_session, :controller => '/admin/sessions'
  map.resource :user_session
  map.resource :users
  map.confirm_account '/users/confirm_account/:id', :controller => :users, 
    :action => :confirm_account, :conditions => { :method => :get }
  map.resource :admins, :except => [:new, :create]
  map.resources :password_resets

  map.terms_of_service "/terms-of-service", :controller => 'welcome', :action => 'terms_of_service'
  map.privacy "/privacy", :controller => 'welcome', :action => 'privacy'
  map.how "/how-it-works", :controller => 'welcome', :action => 'how'
  map.about "/about", :controller => 'welcome', :action => 'about'
  map.involved "/get-involved", :controller => 'welcome', :action => 'involved'
  map.contact "/contact", :controller => 'welcome', :action => 'contact'
  
  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
  map.root :controller => "welcome"

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing or commenting them out if you're using named routes and resources.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
  map.connect '*path', :controller => 'pages', :action => 'show'
end
