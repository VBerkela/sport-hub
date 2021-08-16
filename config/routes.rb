Rails.application.routes.draw do
  scope '(:locale)' do
    resources :articles do
      resources :comments do
        member do
          put "like" => "comments#vote"
        end
      end
    end
    get 'messages/index'
    resources :messages
    resources :categories, except: [:new, :create, :edit]
    devise_for :users

    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
    root 'home#index'
    namespace :admin do
      resources :articles, except: [:show] do
        resources :comments, except: [:show] do
          member do
            put "like" => "comments#vote"
          end
        end
      end
      resources :categories, only: [:new, :create, :edit, :destroy, :update]
    end
  end
end