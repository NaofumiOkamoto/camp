Rails.application.routes.draw do

  root to: 'homes#top'
  get 'about', to: 'homes#about'
  resources :maps, only: [:index]
  resources :camp_sites, only: [:index, :show]
  resources :admin_camp_sites, only: [:new, :create, :index, :show, :edit, :update, :destroy]
  resources :boards, only: [:new, :create, :index, :show, :edit, :update, :destroy]
  resources :admin_boards, only: [:index, :show, :destroy]
  resources :rooms, only: [:index, :create, :destroy]
  resources :like_camps, only: [:create, :destroy]
  resources :like_boards, only: [:create, :destroy]

  devise_for :admins, controllers: {
    sessions:      'admins/sessions',
    passwords:     'admins/passwords',
    registrations: 'admins/registrations'
  }

  devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations'
  }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
