class WelcomeController < ApplicationController
  def index
  end
  
  resources :articles do
    resources :comments
  end
  
end
