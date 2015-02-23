Rentals::Application.routes.draw do
    
  resources :deal_details

  resources :deals

  resources :references

  resources :movie_formats

  resources :weekdays

  resources :payments

  resources :movie_kinds

  resources :rent_details do
    get :autocomplete_movie_name, :on => :collection
  end
  
  resources :rent_details
    
  resources :rents do    
    get :autocomplete_customer_name, :on => :collection       
    #get :generate_rent_details, on: :collection 
    #post :generate_rent_details, on: :collection 
    get :validate_movie_kind, on: :collection 
    member do
          post :update_data
          post :remove_movie   
          #put :generate_rent_details      
        end
  end
        
  resources :customers do
    resources :comprobantes, :only => [:create, :destroy]   
  end
  
  resources :movies do
     member do
            post :get_extra_data
     end
  end

  resources :cities

  resources :states

  resources :genders

  devise_for :users

  #get "home/index"
  root :to => "home#index"
  
  devise_for :users, :controllers => {:sessions => "sessions"}
  
  resources :users
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
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  match ':controller(/:action(/:id(.:format)))'
  match 'plupload_rails/_plupload_uploader', :controller=>'plupload_rails', :action=>'_plupload_uploader', :as=>'pluploader'
  match 'generate_rent_details', :controller => 'rents', :action => 'generate_rent_details'
  
end
