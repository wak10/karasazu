Rails.application.routes.draw do

  scope module: :public do
    root "homes#about"
    resource :users, only:[:show, :edit, :update]
    resources :grow_plants, except:[:new]
    get "/top" => "grow_plants#top"
    get "/grow_plants/pick/:id" => "grow_plants#pick", as: "pick"
    post "/grow_plants/complete/:id" => "grow_plants#complete", as: "complete"
    resources :costom_plants, only:[:new, :create]
    get "/costom_plants/pick/:id" => "costom_plants#pick", as: "costom_pick"
    post "/costom_plants/add" => "costom_plants#add", as: "costom_add"
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
