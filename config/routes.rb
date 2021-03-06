Rails.application.routes.draw do

  devise_for :users
  root to: 'homes#top'
  get 'homes/about' => 'homes#about'
  get 'office' => 'homes#office'
  get 'privacy' => 'homes#privacy'

  resources :post_images do
    resources :post_comments, only:[:create, :destroy]
    resource :favorites, only:[:create, :destroy]
  end

  resources :users, only:[:index, :show, :edit, :update] do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'

  end

  get "search" => "searches#search"


end
