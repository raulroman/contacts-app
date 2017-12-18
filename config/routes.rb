Rails.application.routes.draw do
  namespace :v1 do
    post 'user_token' => 'user_token#create'

    get '/contacts/' => 'contacts#index' 
    get '/contacts/:id' => 'contacts#show'
    post '/contacts/' => 'contacts#create'
    patch '/contacts/:id' => 'contacts#update'
    delete '/contacts/:id' => 'contacts#destroy'

    post '/users/' => 'users#create'

  end
end