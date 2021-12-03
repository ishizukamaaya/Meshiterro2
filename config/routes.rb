Rails.application.routes.draw do

  devise_for :users
  root to: 'homes#top'

  resources :post_images do
    resources :post_comments, only:[:create, :destroy]
    resource :favorites, only:[:create, :destroy]
  end
  resources :users, only:[:show, :edit, :update]

end
