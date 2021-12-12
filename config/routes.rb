Rails.application.routes.draw do

  devise_for :users
  root to: 'homes#top'
  get 'homes/about' => 'homes#about'

  resources :post_images do
    resources :post_comments, only:[:create, :destroy]
    resource :favorites, only:[:create, :destroy]
  end
  resources :users, only:[:index, :show, :edit, :update]

end
