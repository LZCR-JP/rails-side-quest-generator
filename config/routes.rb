Rails.application.routes.draw do
  root to: "pages#home"

  get "up" => "rails/health#show", as: :rails_health_check

  resources :quests do
    collection do
      post :generate
    end

    resources :completions, only: [:create]
  end
  # get '/quests', to: 'quests#index', as: :quests
  # post '/quests', to: 'quests#create'
  # get '/quests/new', to: 'quests#new', as: :new_quest
  # get '/quests/:id', to: 'quests#show', as: :quest
  # get '/quests/:id/edit', to: 'quests#edit', as: :edit_quest
  # patch '/quests/:id', to: 'quests#update'
  # delete '/quests/:id', to: 'quests#destroy'
  # post "/quests/generate", to: "quests#generate", as: :generate_quest
end
