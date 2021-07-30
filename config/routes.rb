Rails.application.routes.draw do
  scope '(:locale)' do
    resources :articles
    resources :categories
    devise_for :users

    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
    root 'home#index'
  end
end
