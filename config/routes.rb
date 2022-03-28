Rails.application.routes.draw do
  get "/kullanıcı_sözleşmesi",to:"users#user_agreement",as: :user_agreement

  get "/verify_email",to:"users#verify_email",as: :verify_email
  post "/verify_email",to:"users#verify_email_post",as: :verify_email_post

  get "/oturum_ac",to:"sessions#new",as: :login
  delete "/oturumu_kapat",to: "sessions#destroy",as: :logout

  get "/:id/geçmiş",to: "profile_features#geçmiş",as: :history
  get "/:id/ödüllerim",to: "profile_features#ödüllerim",as: :prize

  resource :session,only: :create

  #get "/room/:id",to: "rooms#show",as: :other_room

  resources :rooms,except:%i[ index destroy ],path_names:{edit:"düzenle"}
  
  #get "/rooms",to:redirect("/")

  get "/kaydol",to: "users#new",as: :register
  get "/users",to:redirect("/kaydol")

  resources :users,only: %i[ create update destroy ]
  get "/:id",to:"users#show",as: :profile
  get "/:id/düzenle",to:"users#edit",as: :edit_profile

  get "/rooms/:id/join",to:"rooms#join",as: :button_click
  get "/rooms/:id/show_password",to:"rooms#show_password",as: :show_password

  root "rooms#index"
end
