Rails.application.routes.draw do
  resources :users
  resources :posts
  resources :sessions, only: [:new, :create] do
    delete :destroy, on: :collection
  end
  root 'posts#index'
end
