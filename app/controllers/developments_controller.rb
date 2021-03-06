class DevelopmentsController < ApplicationController

  def index
    @developments = Development.all
  end

  def show
    @development = Development.find params[:id]
  end

  def new
    @development = Development.new
    @companies = Company.all.sort_by(&:name)
  end

  def edit
    @development = Development.find params[:id]
    @companies = Company.all.sort_by(&:name)
  end

  def create
    @development = Development.new params[:development]

    if @development.save
      redirect_to @development, :notice => 'Development was successfully created.'
    else
      render :action => "new"
    end
  end

  def update
    @development = Development.find params[:id]

    if @development.update_attributes params[:development]
      redirect_to @development, :notice => 'Development was successfully updated.'
    else
      render :action => "edit"
    end
  end

  def destroy
    @development = Development.find params[:id]
    @development.destroy

    redirect_to developments_url
  end

end
