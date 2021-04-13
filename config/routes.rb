Rails.application.routes.draw do
  devise_for :users
  root to: "calendars#index"

  resources :calendars ,only: [:index, :new, :create, :show, :destroy] do
    
    resources :schedules , only: [:new, :create, :edit, :show, :update, :destroy]
    collection do
      get 'share_user'
    end

    member do 
      get 'share_calendar'
      post 'share_calendar_create'
      get 'share_calendar_show'
    end
    
  end
  resources :share_calendars , only: [ :show, :destroy] do 
    resources :share_schedules , only: [:new, :create, :show, :edit, :update, :destroy]
  end
  
end
