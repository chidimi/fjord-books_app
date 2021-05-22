Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
  devise_scope :user do
    delete 'sign_out', to: 'devise/sessions#destroy', as: :destroy_user_session_path
  end
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks', registrations: 'users/registrations' }
  resources :books
  resources :users, only: %i[index show]
end
