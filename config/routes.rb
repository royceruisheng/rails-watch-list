Rails.application.routes.draw do
  get 'lists/index'
  get 'lists/create'
  get 'lists/new'
  get 'lists/show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :lists, only: [:index, :show, :new, :create]
end
