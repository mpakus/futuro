# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }

  root 'posts/posts#index'

  get '@:user' => 'posts#user', as: :user
  resources :settings, controller: 'settings/settings', only: %i[index create]

  # /home-page
  get ':blog' => 'posts/blogs#index', as: :blog, defaults: { format: 'html' }
  # /home-page/100-title.html
  get ':blog/:id(:format)' => 'posts/posts#show', as: :show_post
  namespace :futuro do
    resources :posts, except: %i[new show] do
      resources :blocks, only: [:create], controller: 'posts/blocks'
      resources :publishes, only: [:create], controller: 'posts/publishes'
      resources :texts, only: [:update], controller: 'posts/blocks/texts'
      resources :albums, only: %i[create destroy], controller: 'posts/blocks/albums', shallow: true do
        resources :photos, only: %i[create destroy], controller: 'posts/blocks/albums/photos'
      end
    end
  end
end
