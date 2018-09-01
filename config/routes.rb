Rails.application.routes.draw do
  # get 'students/index'
  get 'students/search'
  root to: 'students#index'
  get 'search', to: 'students#search'
  resources :students do
    collection { post :import }
  end
end
