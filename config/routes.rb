Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  resources :documents, except: [:edit]
  resources :doc_files, only: [:show]

  root to: 'documents#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
