Rails.application.routes.draw do
  get 'users/index'
  get 'users/show'
  get "matomes/get_novel_info"
  resources :novels
  resources :matomes
  devise_for :users
  resources :users, :only => [:index, :show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'matomes#index'
end
