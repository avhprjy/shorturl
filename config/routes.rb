Rails.application.routes.draw do
  root to: "home#index"
  post "shorturl" => 'home#shorturl'
  get "stats" => 'home#stats'
  get '/:id' => "shortener/shortened_urls#show"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
