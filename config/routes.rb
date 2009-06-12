ActionController::Routing::Routes.draw do |map|
  map.root :controller => 'home', :action => 'index'
  
  map.account '/account', :controller => 'pessoas',   :action => 'edit'
  map.logout  '/logout',  :controller => 'sessions',  :action => 'destroy'
  map.login   '/login',   :controller => 'sessions',  :action => 'login'
  map.signup  '/signup',  :controller => 'pessoas',   :action => 'new'
  
  map.resources :pessoas, :member => { :change_password => :post }
  
  map.resources :projetos do |projetos|
    projetos.resources :tarefas
    projetos.resources :pessoas, :collection => { :invite => :get, :send_invite => :post, :accept_invite => :get }
  end
  
  map.resource :session
end