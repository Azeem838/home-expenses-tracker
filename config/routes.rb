Rails.application.routes.draw do
  devise_for :users
  get 'user', to: "users#show", as: :user_root
  root "welcome#index"
  resources :users, only: [:show] 
  get 'all_expenses', to: 'expenses#all_expenses'
  get 'all_external_expenses', to: 'expenses#all_external_expenses'
  get 'all_groups', to: 'groups#index'
  resources :groups, except: [:index]
  resources :expenses, except: [:show, :index]
  resources :expense_groups, only: [:create, :destroy]
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
