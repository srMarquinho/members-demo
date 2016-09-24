class SchoolsController < ApplicationController
  def index
    @schools = School.all
  end

  def new
    @school = School.new
  end

  def create
    @school = School.create(school_params)
    redirect_to '/schools'
  end

  def show
    @school = School.find(params[:id])
  end

  private
  def school_params
    params.require(:school).permit(:name)
  end
end
