class MembersController < ApplicationController
  def index
    @members = Member.all
  end

  def new
    @member = Member.new
    @schools = School.all
  end

  def create
    @member = Member.create(member_params)
    if @member.save
      redirect_to member_path(@member)
    else
      render 'new'
    end
  end

  def show
    @member = Member.find(params[:id])
  end

  def edit
    @member = Member.find(params[:id])
    @schools = School.all
  end

  def update
    @member = Member.find(params[:id])
    if @member.update(member_params)
      redirect_to member_path(@member)
    else
      render 'edit'
    end
  end

  def destroy
    @member = Member.find(params[:id])
    @member.destroy
    flash[:notice] = 'Member deleted successfully'
    redirect_to members_path
  end

  private
  def member_params
    params.require(:member).permit(:name, :email, :school_ids => [])
  end
end
