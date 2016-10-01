Rails.application.routes.draw do
  resources :projects do
    resources :members, only: [:index]
    member do
      post 'add_member'
      post 'delete_member'
    end
  end

  resources :members, only: [:index, :create, :show, :update, :delete]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
