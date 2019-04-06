Rails.application.routes.draw do
  root to: 'visits#index'

  get 'visits/index'
  post :visits, to: 'visits#create'
  post :contacts, to: 'contacts#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
