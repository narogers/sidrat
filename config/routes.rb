Sidrat::Application.routes.draw do
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Start with the administrative stuff first
  namespace :backend do
    resources :doctors, :except => [:new, :create, :destroy]
    resources :companions, :except => [:destroy]
    resources :series, :except => [:new, :create, :destroy] do
      resources :entries, :except => [:index, :destroy]
    end
  end
  
  match '/search/companion' => 'searches#companion'
  match '/search/contributor' => 'searches#contributor'
  match '/search/publisher' => 'searches#publisher'
  
  # TODO : Figure out how to set a resource to match on the :series param
  #        for an entry and add the proper lines here
  match '/backend/index' => 'backend#index'
  match '/backend' => 'backend#index'
  
  # Media routes for the front end
  #match '/media' => 'media#index'
  #match '/media/:collection' => 'media#browse'
  #match '/media/:collection/:title' => 'media#details'
  
  # Doctor related paths
  match '/doctors' => 'doctors#index'
  
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

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => 'sidrat#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
