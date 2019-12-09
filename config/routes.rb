Rails.application.routes.draw do
  resources :applications


  get 'applicationform/index'

  get 'welcome/index'
  get 'application/list'
  get 'application/new'
  post 'application/create'

  post "grader_application/new" => 'grader_application#create'
  get 'grader_application/show'

  patch 'application/update'
  get 'application/show'
  get 'application/edit'
  get 'application/delete'
  get 'application/update'
  get 'application/show_student_application'
  get 'application/index'
  get 'applicationform/index'
  post '/grader_application/list'
  post '/grader_application/accept' => 'grader_application#accept'
  post '/grader_application/reject' => 'grader_application#reject'
  get '/courses' => 'courses#scrape'
  put 'grader_application/:id' => 'grader_application#accept'
  put 'grader_application/:id' => 'grader_application#reject'


  devise_for :users, :controllers => { :registrations => "users/registrations" }

  resources :recommandationform
  resources :courses
  resources :applicationform
  get 'grader_application/list'
  resources :grader_application

  root 'welcome#index'
  post "recommandationform/new" => 'recommandationform#create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
