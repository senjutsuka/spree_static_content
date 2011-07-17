Rails.application.routes.draw do

  namespace :admin do
    resources :cms_pages
  end

  match '/static/*path', :to => 'static_content#show', :via => :get, :as => 'static'

end
