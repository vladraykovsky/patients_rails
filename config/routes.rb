Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html scope :'/api' do
  scope :'/api' do
  resources :patients do
    resources :comments
  end
  end

end