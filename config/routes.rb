Rails.application.routes.draw do
  root 'homes#top'

  devise_for :users, controllers: {registrations: 'users/registrations'}
  resources :users, only: [:show, :edit]

  resources :posts

  resources :tags do
    get 'posts' => 'posts#search'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
