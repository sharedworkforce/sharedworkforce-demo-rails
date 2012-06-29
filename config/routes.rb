SwDemo::Application.routes.draw do
  resources :cats, :except => [:destroy, :edit, :update] do
  	get :approved, :on => :collection
  	get :pending, :on => :collection
  	get :rejected, :on => :collection
  	get :eyes, :on => :collection
  end
  root :to => 'cats#index'
end
