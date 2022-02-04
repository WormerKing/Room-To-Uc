Rails.application.routes.draw do
  get "/users",to:redirect("/kaydol")
  get "/users/new",to:redirect("/kaydol")
  resources :users,except: %i[index]
  get "/kaydol",to: "users#new",as: :register
end
