Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions' }
  #devise_for :users, path: 'auth', path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: 'cmon_let_me_in' }
  root "projects#index"
  resources :projects

  devise_scope :user do
    get 'user/sign_out' => "devise/sessions#destroy"
  end
end