Rails.application.routes.draw do
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
