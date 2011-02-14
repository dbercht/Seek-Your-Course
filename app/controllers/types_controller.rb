class TypesController < ApplicationController
  def index
    @types = Type.find(:all, :order => 'category ASC')
  end

  def show
    @type = Type.find(params[:id])
    @offerings = @type.offerings
    @title = @type.category
    render "offerings/index"
  end

  def new
    @type = Type.new
  end

  def create
    @type = Type.new(params[:type])
    if @type.save
      flash[:notice] = "Successfully created type."
      redirect_to :action => :index
    else
      render :action => 'new'
    end
  end

  def edit
    @type = Type.find(params[:id])
  end

  def update
    @type = Type.find(params[:id])
    if @type.update_attributes(params[:type])
      flash[:notice] = "Successfully updated type."
      redirect_to :action => :index
    else
      render :action => 'edit'
    end
  end

  def destroy
    @type = Type.find(params[:id])
    @type.destroy
    flash[:notice] = "Successfully destroyed type."
    redirect_to types_url
  end
end
