Rails.application.routes.draw do
  devise_for :users
  root to: "calendars#index"
  resources :calendars ,only: [:index, :new, :create, :show] do
    resources :schedules , only: [:new, :create, :edit, :show, :update, :destroy]
  end
  
end
