Rails.application.routes.draw do
  get 'home' => 'home#index'

  get 'about' => 'home#about'

  post 'showWorkout' => 'home#showWorkout'

  post 'showSchedule' => 'home#showSchedule'

  get 'register' => 'users#new'

  post 'startpage' => 'startpage#index'

  controller :sessions do
    get  'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end

  resources :users

  root to: 'startpage#index'
  
end
