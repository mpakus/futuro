Rails.application.routes.draw do
  resources :posts
  devise_for :users
  root 'main#index'

  get '@:user_uri'         => 'posts#user', as: :show_user
  get ':blog/:id(:format)' => 'posts#show', as: :show_post
end
