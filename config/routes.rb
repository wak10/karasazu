Rails.application.routes.draw do

  scope module: :public do
    root "homes#about"
    resource :users, only:[:show, :edit, :update]
    resources :grow_plants, except:[:new]
    get "/top" => "grow_plants#top"
    get "/grow_plants/pick/:id" => "grow_plants#pick", as: "pick"
    post "/grow_plants/complete/:id" => "grow_plants#complete", as: "complete"
    resources :custom_plants, except:[:show, :index]
    get "/custom_plants/pick/:id" => "custom_plants#pick", as: "custom_pick"
    post "/custom_plants/add" => "custom_plants#add", as: "custom_add"
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
