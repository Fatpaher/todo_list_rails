Rails.application.routes.draw do
  root to: 'todo_lists#index'

  resources :todo_lists, only: [:index, :show, :new, :create], shallow: true do
    resources :tasks, only: [:new, :create]
  end

end
