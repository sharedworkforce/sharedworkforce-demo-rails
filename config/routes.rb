SwDemo::Application.routes.draw do
  resources :cats, :except => [:destroy, :edit, :update]
  root :to => 'cats#index'
end
