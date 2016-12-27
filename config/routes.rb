Rails.application.routes.draw do
  root 'main#welcome'

  get '/composer/:id', to: 'composer#show'

  get '/edition/:id', to: 'edition#show'

  get '/work/:id', to: 'work#show'

  get 'main/welcome'
end
