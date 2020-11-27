Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "api/learning_modules#index"

  namespace :api, defaults: { format: :json } do
    resources :users, only: [:create] do
      get :access_token, on: :collection
      patch :update_subscription, on: :collection
    end

    resources :learning_modules, only: %i[index create] do
      resources :courses, only: %i[index create]
    end

    get "courses", to: "courses#enrollable_courses"
  end
end
