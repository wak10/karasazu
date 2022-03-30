Rails.application.routes.draw do

  scope module: :public do
    root "homes#about"
    get "/version" => "homes#version"
    resource :users, only:[:show, :edit, :update]
    resources :grow_plants do
      member do
        get "pick"
        post "complete"
      end
      collection do
        post "register"
      end
    end
    get "/top" => "grow_plants#top"

  end

  devise_for :users, skip: [:passwords],controllers: {
    registrations: "public/registrations",
    sessions: "public/sessions"
  }



  namespace :admin do
    resources :plants, except:[:show]
  end

  devise_for :admin, skip: [:registrations, :passwords],controllers: {
    sessions: "admin/sessions"
  }


end
