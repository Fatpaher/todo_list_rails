Rails.application.routes.draw do
  root to: 'todo_lists#index'

  resources :todo_lists, only: [:index, :new, :create]
  resources :tasks, only: [:create]
end
