Rails.application.routes.draw do
  # Routes for the Country resource:
  # CREATE
  get "/countries/new", :controller => "countries", :action => "new"
  post "/create_country", :controller => "countries", :action => "create"

  # READ
  get "/countries", :controller => "countries", :action => "index"
  get "/countries/:id", :controller => "countries", :action => "show"

  # UPDATE
  get "/countries/:id/edit", :controller => "countries", :action => "edit"
  post "/update_country/:id", :controller => "countries", :action => "update"

  # DELETE
  get "/delete_country/:id", :controller => "countries", :action => "destroy"
  #------------------------------

  # Routes for the Recommendation resource:
  # CREATE
  get "/recommendations/new", :controller => "recommendations", :action => "new"
  post "/create_recommendation", :controller => "recommendations", :action => "create"

  # READ
  get "/recommendations", :controller => "recommendations", :action => "index"
  get "/recommendations/:id", :controller => "recommendations", :action => "show"

  # UPDATE
  get "/recommendations/:id/edit", :controller => "recommendations", :action => "edit"
  post "/update_recommendation/:id", :controller => "recommendations", :action => "update"

  # DELETE
  get "/delete_recommendation/:id", :controller => "recommendations", :action => "destroy"
  #------------------------------

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
