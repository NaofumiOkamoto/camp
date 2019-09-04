Rails.application.routes.draw do

  root to: 'homes#top'
  get 'about', to: 'homes#about'
  resources :maps, only: [:index]
  resources :admin_users, only: [:index, :show, :destroy]
  resources :camp_sites, only: [:index, :show]
  resources :admin_camp_sites, only: [:new, :create, :index, :show, :edit, :update, :destroy]
  resources :boards, only: [:new, :create, :index, :show, :edit, :update, :destroy]
  resources :admin_boards, only: [:index, :show, :destroy]
  resources :rooms, only: [:index, :create, :destroy]
  post 'like_camps/:camp_site_id', to: 'like_camps#like_camp_site', as: 'like_camp'
  delete 'like_camps/:camp_site_id', to: 'like_camps#unlike_camp_site', as: 'like_camps'

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
  resources :users, only: [:show, :edit, :index, :destroy, :update]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
