class WorkshopsController < ApplicationController

  def allworkshops
    @allworkshops = Workshop.all

    render("workshop_templates/allworkshops.html.erb")
  end

  def myworkshops
    @myworkshops = Workshop.where({:provider_id => @user}).all
    
    render("workshop_templates/myworkshops.html.erb")
  end

  def details
    @workshop = Workshop.where({ :id => params.fetch("id_to_display") }).first

    render("workshop_templates/details.html.erb")
  end

  def blank_form
    @workshop = Workshop.new

    render("workshop_templates/blank_form.html.erb")
  end

  def save_new_info
    @workshop = Workshop.new

    @workshop.title = params.fetch("title")
    @workshop.description = params.fetch("description")
    @workshop.starts_at = params.fetch("starts_at")
    @workshop.ends_at = params.fetch("ends_at")
    @workshop.price = params.fetch("price")
    @workshop.provider_id = params.fetch("provider_id")
    @workshop.image = params.fetch("image")
    @workshop.capacity = params.fetch("capacity")
    @workshop.location = params.fetch("location")
    @workshop.other = params.fetch("other")

    if @workshop.valid?
      @workshop.save

      redirect_to("/workshops", { :notice => "Workshop created successfully." })
    else
      render("workshop_templates/blank_form.html.erb")
    end
  end

  def prefilled_form
    @workshop = Workshop.where({ :id => params.fetch("id_to_prefill") }).first

    render("workshop_templates/prefilled_form.html.erb")
  end

  def save_edits
    @workshop = Workshop.where({ :id => params.fetch("id_to_modify") }).first

    @workshop.title = params.fetch("title")
    @workshop.description = params.fetch("description")
    @workshop.starts_at = params.fetch("starts_at")
    @workshop.ends_at = params.fetch("ends_at")
    @workshop.price = params.fetch("price")
    @workshop.provider_id = params.fetch("provider_id")
    @workshop.image = params.fetch("image")
    @workshop.capacity = params.fetch("capacity")
    @workshop.location = params.fetch("location")
    @workshop.other = params.fetch("other")

    if @workshop.valid?
      @workshop.save

      redirect_to("/workshops/" + @workshop.id.to_s, { :notice => "Workshop updated successfully." })
    else
      render("workshop_templates/prefilled_form.html.erb")
    end
  end

  def remove_row
    @workshop = Workshop.where({ :id => params.fetch("id_to_remove") }).first

    @workshop.destroy

    redirect_to("/workshops", { :notice => "Workshop deleted successfully." })
  end
end
