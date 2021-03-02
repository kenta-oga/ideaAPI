Rails.application.routes.draw do
  resources :categories do
    resources :ideas
    collection do
      post 'search'
    end
  end
end
