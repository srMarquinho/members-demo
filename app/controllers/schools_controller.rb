class SchoolsController < ApplicationController
  def index
    @schools = School.all
  end

  def new
    @school = School.new
  end

  def create
    @school = School.create(school_params)
    if @school.save
      redirect_to school_path(@school.id)
    else
      render 'new'
    end
  end

  def show
    @school = School.find(params[:id])
  end

  def edit
    @school = School.find(params[:id])
  end

  def update
    @school = School.find(params[:id])
    @school.update(school_params)
    redirect_to school_path(@school.id)
  end

  def destroy
    @school = School.find(params[:id])
    @school.destroy
    flash[:notice] = 'School deleted successfully'
    redirect_to schools_path
  end

  private
  def school_params
    params.require(:school).permit(:name)
  end
end
