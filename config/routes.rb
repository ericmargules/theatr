Rails.application.routes.draw do
	
	devise_for :users
	
	root 'welcome#index'

	resources :movies, :auditoriums, :orders, :showtimes

end
