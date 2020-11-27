Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "api/learning_modules#index"

  namespace :api, defaults: { format: :json } do
    post "users/signup", to: "users#signup"
    get "users/access_token", to: "users#access_token"

    resources :learning_modules, only: %i[index create]
  end
end
