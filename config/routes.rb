Rails.application.routes.draw do
  resources :projects do
    member do
      post 'add_member'
      post 'remove_member'
      get 'members'
      get 'standups'
    end
  end

  resources :members, only: [:index, :create, :show, :update, :destroy] do
    member do
      get 'projects'
      get 'standups'
    end
  end
  resources :standups, only: [:create, :show, :update, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
