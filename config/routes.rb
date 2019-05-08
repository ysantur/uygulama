Rails.application.routes.draw do
  devise_for :users
  resources :yazars, :path =>"yazarlar" 
  resources :kitaps, :path =>"kitaplar" do
    put "like", to: "kitaps#like"
  end
  root "kitaps#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
