Rails.application.routes.draw do
	
	devise_for :users
	
	devise_scope :user do
		get '/admin' => 'devise/sessions#new'
	end
	
	root 'welcome#index'

	get 'user_root' => 'welcome#admin'


	resources :movies, :auditoriums, :orders, :showtimes

end
