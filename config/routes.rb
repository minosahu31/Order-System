Rails.application.routes.draw do
  devise_for :users, path_names: {
                       sign_up: "", #To Stop Sign Up action
                     }

  root to: "orders#index"

  resources :orders
end
