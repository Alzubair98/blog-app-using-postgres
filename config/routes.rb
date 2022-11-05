Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  get 'current_user/index'
  namespace :api do
    namespace :v1 do
      get 'posts/index'
      get 'posts/show'
      post 'comments/new'
    end
  end

  namespace :api do 
    namespace :v1 do
      resources :posts
      resources :comments
    end
  end

  get '/current_user', to: 'current_user#index'
    
  devise_for :users, path: '', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    registration: 'signup'
  },
  controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  
  root to: 'users#index' 
  resources :users, only: [:index, :show] do 
    resources :posts do
      resources :comments, only:[:new, :create, :destroy]
      resources :likes, only:[:create]
    end
  end
end
