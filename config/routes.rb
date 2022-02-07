Rails.application.routes.draw do
  get "/oturum_ac",to:"sessions#new",as: :login
  delete "/oturumu_kapat",to: "sessions#destroy",as: :logout

  resource :session,only: :create

  get "/kaydol",to: "users#new",as: :register
  get "/users",to:redirect("/kaydol")

  resources :users,only: %i[ create update destroy ]
  get "/:id",to:"users#show",as: :profile
  get "/:id/düzenle",to:"users#edit",as: :edit_profile
end
