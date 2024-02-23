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
  
  get '/task_show', to: 'organization#task_show'
  post '/task_create', to: 'organization#task_create'
  post '/member_create', to: 'organization#member_create'
  #Admin Routes
  get '/organization_all', to: 'admin#organization_index' 
  get '/organization/:id', to: 'admin#organization_show' 
  post '/organization_create', to: 'admin#organization_create'
  patch '/organization/:id', to: 'admin#organization_update' 
  delete '/organization/:id', to: 'admin#organization_destroy'
  get '/free_project_all_admin', to: 'free_project#free_project_show'
  get'/paid_project_all_admin', to: 'paid_project#paid_project_show'
  get '/member_all_admin', to:'member#member_show'
  get '/task_all_admin', to:'tas#task_show'
  #Member Routes
  get '/task_index_mem', to: 'member#task_index'
  post '/task_create_mem', to: 'member#task_create'
  
  patch '/task_update/:id', to: 'member#task_update' 
  delete '/task_delete/:id', to: 'member#task_destroy'

  
    


end
