Rails.application.routes.draw do
  resources :projects do
    member do
      post 'add_member'
      post 'remove_member'
      get 'members'
      get 'standups'
    end
  end

  resources :members do
    member do
      get 'projects'
      get 'standups'
    end
  end
  resources :standups, except: [:index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
