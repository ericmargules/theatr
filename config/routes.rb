Rails.application.routes.draw do
	root 'welcome#index'

	resources :movies, :auditoriums, :orders

end
