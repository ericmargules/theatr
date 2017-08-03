Rails.application.routes.draw do
	
	devise_for :users
	
	root 'welcome#index'

	get 'user_root' => 'welcome#admin'

	get '/admin' => 'welcome#admin'

	resources :movies, :auditoriums, :orders, :showtimes

end
