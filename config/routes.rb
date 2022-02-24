Rails.application.routes.draw do
  get "/oturum_ac",to:"sessions#new",as: :login
  delete "/oturumu_kapat",to: "sessions#destroy",as: :logout

  get "/:id/girdiğim-odalar",to: "profile_features#odalar",as: :oda
  get "/:id/geçmiş",to: "profile_features#geçmiş",as: :histroy
  get "/:id/ödüllerim",to: "profile_features#ödüllerim",as: :prize
  get "/:id/cezalarım",to: "profile_features#cezalarım",as: :punishment
  get "/:id/hesabım",to: "profile_features#hesabım",as: :my_profile

  resource :session,only: :create

  get "/room/:id",to: "rooms#show",as: :room

  resources :rooms,except:%i[ show index destroy ],path_names:{edit:"düzenle"}
  
  #get "/rooms",to:redirect("/")

  get "/kaydol",to: "users#new",as: :register
  get "/users",to:redirect("/kaydol")

  resources :users,only: %i[ create update destroy ]
  get "/:id",to:"users#show",as: :profile
  get "/:id/düzenle",to:"users#edit",as: :edit_profile

  get "/room/:id/join",to:"rooms#join",as: :button_click
  get "/room/:id/show_password",to:"rooms#show_password",as: :show_password

  root "rooms#index"
end
