Rails.application.routes.draw do
  resources :projects do
    resources :members, only: [:index]
    resources :standups, only: [:index]
    member do
      post 'add_member'
      post 'delete_member'
    end
  end

  resources :members, only: [:index, :create, :show, :update, :destroy]
  resources :standups, only: [:create, :show, :update, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
