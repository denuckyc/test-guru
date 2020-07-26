Rails.application.routes.draw do
  root 'tests#index'

  get :signup, to: 'users#new'
  get :login, to: 'sessions#new'
  delete :logout, to: 'sessions#destroy'

  resources :users, only: :create
  resources :sessions, only: :create

  resources :test_passages, only: [:show, :update] do
    member do
      get :result
    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # root to: 'questions#index'

  resources :tests do
    resources :questions, shallow: true do
      resources :answers, shallow: true, except: :index
    end

    member do
      post :start
    end
  end
end
