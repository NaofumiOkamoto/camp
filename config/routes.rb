Rails.application.routes.draw do

  get 'rooms/show'
  root to: 'homes#top'
  get 'about', to: 'homes#about'
  resources :maps, only: [:index]
  get '/map_request', to: 'maps#map', as: 'map_request'
  get '/ranking', to: 'homes#ranking_history', as: 'ranking'
  resources :admin_users, only: [:index, :show, :destroy]
  resources :camp_sites, only: [:index]
  get 'camp_sites/:camp_site_id', to: 'camp_sites#show', as: 'camp_site'
  resources :admin_camp_sites, only: [:new, :create, :index, :show, :edit, :update, :destroy]
  resources :boards, only: [:new, :create, :index, :show, :edit, :update, :destroy] do
    resource :board_comments, only: [:create, :destroy]
  end
  resources :admin_boards, only: [:index, :show, :destroy]
  resources :rooms, only: [:index, :create, :destroy]
  post 'like_camps/:camp_site_id', to: 'like_camps#like_camp_site', as: 'like_camp'
  delete 'like_camps/:camp_site_id', to: 'like_camps#unlike_camp_site', as: 'like_camps'
  post 'like_boards/:board_id', to: 'like_boards#like_board', as: 'like_board'
  delete 'like_boards/:board_id', to: 'like_boards#unlike_board', as: 'like_boards'

  devise_for :admins, controllers: {
    sessions:      'admins/sessions',
    passwords:     'admins/passwords',
    registrations: 'admins/registrations'
  }

  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks', #snsログイン
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations'
  }


  resources :users, only: [:edit, :index, :destroy, :update, :show] do
    member do
      get :following, :followers
    end
  end
  resources :relationships, only: [:create, :destroy]

  #mount ActionCable.server => '/cable'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
