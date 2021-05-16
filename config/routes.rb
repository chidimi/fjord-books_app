Rails.application.routes.draw do
  resources :books
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  scope '(:locale)', locale: /en|nl/ do
    resources :books
  end
end
