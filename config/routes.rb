Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "searchs#index"

  resources :subjects, only: [:create]
  resources :resources, only: [:index, :show, :new, :create] do
    resources :sections, only: [:create, :destroy]
  end

  resources :articles, only: [:index, :new,  :create]

  resources :articles, only: [:show] do
    resources :translations, controller: 'articles/translations', only: [:new, :create, :edit, :update]
  end

  resources :sections, only: [:show] do
    resources :translations, only: [:new, :create, :show, :edit, :update]
  end
end
