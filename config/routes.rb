Rails.application.routes.draw do
  root to: 'categories#index'
  resources :categories do
    resources :ideas
    collection do
      post 'search'
    end
  end
end
