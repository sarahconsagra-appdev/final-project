Rails.application.routes.draw do
  # Routes for the Workshop resource:

  match("/", { :controller => "workshops", :action => "allworkshops", :via => "get" })
  match("/myworkshops", { :controller => "workshops", :action => "myworkshops", :via => "get" })
  
  match("/myprofile", { :controller => "users", :action => "myprofile", :via => "get"})
  
  # CREATE
  match("/new_workshop_form", { :controller => "workshops", :action => "blank_form", :via => "get" })
  match("/insert_workshop_record", { :controller => "workshops", :action => "save_new_info", :via => "post" })

  # READ
  match("/workshops", { :controller => "workshops", :action => "allworkshops", :via => "get" })
  match("/workshops/:id_to_display", { :controller => "workshops", :action => "details", :via => "get" })


  # UPDATE
  match("/existing_workshop_form/:id_to_prefill", { :controller => "workshops", :action => "prefilled_form", :via => "get" })
  match("/update_workshop_record/:id_to_modify", { :controller => "workshops", :action => "save_edits", :via => "post" })

  # DELETE
  match("/delete_workshop/:id_to_remove", { :controller => "workshops", :action => "remove_row", :via => "get" })

  #------------------------------

  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  
  match("/users", { :controller => "users", :action => "index", :via => "get" })
  match("/users/:id", { :controller => "users", :action => "show", :via => "get" })
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
