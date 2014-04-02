Izauth::Application.routes.draw do
  devise_for :users, controllers: {sessions: 'sessions', registrations: 'registrations'}

  devise_scope :user do
    get    'sign_in',  to: 'devise/sessions#new'
    get    'sign_up',  to: 'devise/registrations#new'
    delete 'sign_out', to: 'devise/sessions#destroy'
  end
  
  get 'logins', to: 'home#logins', as: :logins

  root to: 'home#index', as: :home
end
