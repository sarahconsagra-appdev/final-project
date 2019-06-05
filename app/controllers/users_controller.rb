class UsersController < ApplicationController
    
  def index
    @users = User.all.order({ :last_name => :asc })
    render("user_templates/index.html.erb")
  end
  
  def show
    @user = User.where({ :id => params.fetch("id") }).at(0)
    render("user_templates/show.html.erb")
  end
  
end