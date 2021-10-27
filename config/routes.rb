Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

get "/products" => "products#index"

get "/product/:id" => "products#show"

post "/products" => "products#create"

post "/users" => "users#create"

post "/sessions" => "sessions#create"

###orders index
get '/orders' => 'orders#index'

###orders show
get '/orders' => 'orders#show'

###order create
post '/orders' => 'orders#create'

###order update
put '/models' => 'models#update'

end 