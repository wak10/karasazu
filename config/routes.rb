Rails.application.routes.draw do

  scope module: :public do
    root "homes#top"
    resource :users, only:[:show, :edit, :update]
    resources :grow_plants, except:[:edit]
    post "/grow_plants/complete/:id" => "grow_plants#complete", as: "complete"
  end

  devise_for :users, skip: [:passwords],controllers: {
    registrations: "public/registrations",
    sessions: "public/sessions"
  }



  namespace :admin do
    resources :plants, only: [:index, :new, :create, :update, :edit]
  end

  devise_for :admin, skip: [:registrations, :passwords],controllers: {
    sessions: "admin/sessions"
  }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
