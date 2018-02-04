Rails.application.routes.draw do
  root 'home#index'

  devise_for :users

  resources :lists

  resources :elements
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'shared_lists',     to: 'lists#shared_lists',     :as => 'shared_lists'
  get 'shared_list/:id',  to: 'lists#show_shared_list', :as => 'shared_list'

  get 'all_lists',        to: 'lists#all_lists',        :as => 'all_lists'
  get 'all_list/:id',     to: 'lists#show_all_list',    :as => 'all_list'
end
