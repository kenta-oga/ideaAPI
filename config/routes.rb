Rails.application.routes.draw do
  root to: 'categories#index'
  resources :categories, only: [:index, :create] do
    collection do
      post 'search'
    end
  end
end
