Dradis::Plugins::JSON::Engine.routes.draw do
  resources :projects, only: [] do
    resource :report, only: [:create], path: '/export/json/reports'
  end
end
