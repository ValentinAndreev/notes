Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#welcome'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  get 'logout' => 'sessions#destroy', as: :logout   
  resources :plans do
    resources :tasks
    post :update_row_order, on: :collection
  end
  get 'executed/:plan_id/:id' => 'tasks#executed', as: :executed
  get 'not_executed/:plan_id/:id' => 'tasks#not_executed', as: :not_executed
  resources :users
end
