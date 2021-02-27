Rails.application.routes.draw do
  get 'favorites/create'
  get 'favorites/destroy'
  root 'homes#top'

  devise_for :users, controllers: {registrations: 'users/registrations'}
  resources :users, only: [:show, :edit]

  resources :posts do
    resources :post_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end

  resources :tags do
    get 'posts' => 'posts#search'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
