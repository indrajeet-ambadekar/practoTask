Blog::Application.routes.draw do
	root :to => "articles#index"
	
	# match "/auth/:provider/callback" => "sessions#create"
	# match "/signout" => "sessions#destroy", :as => :signout
	match '/auth/twitter/callback', to: 'sessions#create', via: [:get, :post]
	match '/signout', to: 'sessions#destroy', :as=> :signout, via: [:get, :post]
	
	resources :comments
	resources :articles
end
