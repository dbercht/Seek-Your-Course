class InstructorsController < ApplicationController
  def index
    @instructors = Instructor.all
  end

  def show
    @instructor = Instructor.find(params[:id])
  end

  def new
    @instructor = Instructor.new
  end

  def create
    @instructor = Instructor.new(params[:instructor])
    if @instructor.save
      flash[:notice] = "Successfully created instructor."
      redirect_to @instructor
    else
      render :action => 'new'
    end
  end

  def edit
    @instructor = Instructor.find(params[:id])
  end

  def update
    @instructor = Instructor.find(params[:id])
    if @instructor.update_attributes(params[:instructor])
      flash[:notice] = "Successfully updated instructor."
      redirect_to @instructor
    else
      render :action => 'edit'
    end
  end

  def destroy
    @instructor = Instructor.find(params[:id])
    @instructor.destroy
    flash[:notice] = "Successfully destroyed instructor."
    redirect_to instructors_url
  end
end
