Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "searchs#index"

  resources :subjects, only: [:create]
  resources :resources, only: [:index, :show, :new, :create] do
    resources :sections, only: [:create, :destroy]
  end
end
