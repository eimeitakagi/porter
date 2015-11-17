Rails.application.routes.draw do

  devise_for :users
  resources :users, only:[:index, :show, :edit, :update] do
    member do
      get :like_notes
    end
  end
  resources :notes, only:[:show, :new, :create, :edit, :update, :destroy] do
    member do
      get :liking_users
    end
  end

  post "/like/:note_id" => "likes#like", as: "like"
  delete '/unlike/:note_id' => "likes#unlike", as: "unlike"

  root "home#top"
  get "/about" => "home#about"
end
