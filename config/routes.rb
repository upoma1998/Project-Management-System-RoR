Rails.application.routes.draw do
  devise_for :users, controllers:{
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
 
  resources :users1
  get '/member_details' => 'members#index'
  
      resources :paid_projects
      resources :free_projects
      #resources :users
    


end
