Rails.application.routes.draw do
  # Routes for the Conversation resource:
  # CREATE
  get "/conversations/new", :controller => "conversations", :action => "new"
  post "/create_conversation", :controller => "conversations", :action => "create"

  # READ
  get "/conversations", :controller => "conversations", :action => "index"
  get "/conversations/:id", :controller => "conversations", :action => "show"

  # UPDATE
  get "/conversations/:id/edit", :controller => "conversations", :action => "edit"
  post "/update_conversation/:id", :controller => "conversations", :action => "update"

  # DELETE
  get "/delete_conversation/:id", :controller => "conversations", :action => "destroy"
  #------------------------------

  # Routes for the Connection resource:
  # CREATE
  get "/connections/new", :controller => "connections", :action => "new"
  post "/create_connection", :controller => "connections", :action => "create"

  # READ
  get "/connections", :controller => "connections", :action => "index"
  root "connections#index"
  get "/connections/:id", :controller => "connections", :action => "show"

  # UPDATE
  get "/connections/:id/edit", :controller => "connections", :action => "edit"
  post "/update_connection/:id", :controller => "connections", :action => "update"

  # DELETE
  get "/delete_connection/:id", :controller => "connections", :action => "destroy"
  #------------------------------

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
