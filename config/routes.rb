Rails.application.routes.draw do
  
  root to: "tests#index"

  devise_for :users, path_names: { sign_in: :login, sign_out: :logout }

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :tests, only: :index do
    

    member do
      post :start
    end
  end

  resources :results, only: [:show, :update] do
    member do
      get :result
      resources :gists, only: [:create]
    end
  end


  namespace :admin do
    resources :tests do 
      patch :update_inline, on: :member
      resources :questions, shallow: true, except: :index do
        resources :answers, shallow: true, except: :index
      end
    end
  end
end
