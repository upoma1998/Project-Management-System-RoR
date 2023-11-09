require 'sidekiq/web'
require 'sidekiq/cron/web'
Rails.application.routes.draw do
  
  
  
  
  get '/current_user', to: 'current_user#index'
  get '/current_admin', to: 'current_admin#index'
  get '/current_member', to: 'current_member#index'
  mount Sidekiq::Web => '/sidekiq'
  devise_for :organizations, path:'',path_names:{
   
    sign_in: 'login',
    sign_out: 'logout',
    registration: 'signup'
    
  },

   controllers:{
    sessions: 'organizations/sessions',
    registrations: 'organizations/registrations'
  }
  devise_for :admins, path:'',path_names:{
   
    sign_in: 'adminlogin',
    sign_out: 'adminlogout',
    registration: 'adminsignup'
    
  },

   controllers:{
    sessions: 'admins/sessions',
    registrations: 'admins/registrations'
  }
  devise_for :members, path:'',path_names:{
   
    sign_in: 'memberlogin',
    sign_out: 'memberlogout',
    registration: 'membersignup'
    
  },

   controllers:{
    sessions: 'members/sessions',
    registrations: 'members/registrations'
  }
  #resources :users1
  #resources :paid_projects
  #resources :free_projects

  # Organization Operations
  get '/free_project_all', to: 'organization#free_project_index' 
  get '/free_project/:id', to: 'organization#free_project_show' 
  post '/free_project_create', to: 'organization#free_project_create'
  patch '/free_project/:id', to: 'organization#free_project_update' 
  delete '/free_project/:id', to: 'organization#free_project_destroy' 

  get '/paid_project_all', to: 'organization#paid_project_index' 
  get '/paid_project/:id', to: 'organization#paid_project_show' 
  post '/paid_project_create', to: 'organization#paid_project_create'
  patch '/paid_project/:id', to: 'organization#paid_project_update' 
  delete '/paid_project/:id', to: 'organization#paid_project_destroy' 
  get '/task_index', to: 'organization#task_index'
  get '/task_show', to: 'organization#task_show'

  #Admin Routes
  get '/organization_all', to: 'admin#organization_index' 
  get '/organization/:id', to: 'admin#organization_show' 
  post '/organization_create', to: 'admin#organization_create'
  patch '/organization/:id', to: 'admin#organization_update' 
  delete '/organization/:id', to: 'admin#organization_destroy'
  #Member Routes
  get '/assign_task_view', to: 'member#assign_task_view'
  post '/assign_task', to: 'member#assign_task'
  
  patch '/tasks/:id', to: 'member#task_update' 
  delete '/tasks/:id', to: 'member#task_destroy'

  
    


end
