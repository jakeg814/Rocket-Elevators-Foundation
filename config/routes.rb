Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
 

get "home/login"
get "/" => "home#index", :as => "root"
post "/" , to: "home#create"
get "residential" => "home#residential"
get "commercial" => "home#commercial"
get "quote" => "home#quote"
get "/intervention" => "home#intervention"
post "/intervention", to: "intervention#create"
get "/get_building/:id", to: 'intervention#get_building'
get "/get_battery/:id", to: 'intervention#get_battery'
get "/get_elevator/:id", to: 'intervention#get_elevator'
get "/get_column/:id", to: 'intervention#get_column'
post "getData" => "quote#getData"
get "building_select/:customerID", to: 'intervention#building_select'
get "battery_select/:buildingID", to: 'intervention#battery_select'
get "column_select/:batteryID", to: 'intervention#column_select'
get "elevator_select/:columnID", to: 'intervention#elevator_select'

get 'streamer' => 'home#streamer'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
