# frozen_string_literal: true
Rails.application.routes.draw do
  devise_for :users
  root 'posts/posts#index'

  get '@:user_uri' => 'posts#user', as: :show_user

  # /home-page
  get ':blog' => 'posts/blogs#index', as: :blog_posts, defaults: { format: 'html' }
  # /home-page/100-title.html
  get ':blog/:id(:format)' => 'posts/posts#show', as: :show_post
  namespace :futuro do
    resources :posts, except: [:create, :show]
  end
end
