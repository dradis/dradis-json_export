Dradis::Plugins::JSON::Engine.routes.draw do
  post '/report/:project_id', to: 'base#index', as: :report
end
