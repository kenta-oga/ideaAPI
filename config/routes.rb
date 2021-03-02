Rails.application.routes.draw do
  resources :categories, only: [:index, :create] do
    collection do
      post 'search'
    end
  end
end
