Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  get '/api/terminals(.:format)' => 'terminals#index'
  get '/api/terminals/:id(.:format)' => 'terminals#show', as: :terminal
  patch '/api/terminals/:id(.:format)' => 'terminals#update'
  post 'api/terminals(.:format)' => 'terminals#create'
  delete '/api/terminals/:id(.:format)' => 'terminals#destroy'
  
  match '*path', to: 'application#not_found', via: :all
end
