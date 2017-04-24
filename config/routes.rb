Rails.application.routes.draw do

  get 'instrument/show'

  root 'main#welcome'

  get '/composer/:id', to: 'composer#show'

  get '/edition/:id', to: 'edition#show'

  get '/work/:id', to: 'work#show'

  post '/customer/login', to: 'customer#login'
  post '/customer/signup', to: 'customer#signup'

  get 'main/period/:id', to: 'main#show_period'

  get 'main/welcome'
end
