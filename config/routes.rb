Rails.application.routes.draw do
	root 'welcome#index'

	resources :movies, :auditoriums

end
