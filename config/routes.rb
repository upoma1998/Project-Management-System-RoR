Rails.application.routes.draw do
  devise_for :users, controllers:{
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  scope :main do
   resources :users do
    collection do

    end
   end
  end
  get '/member_details' => 'members#index'
  
      resources :paid_projects
      resources :users
    


end
