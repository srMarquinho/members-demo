class MembersController < ApplicationController
  def index
    @members = Member.all
  end

  def new
    @member = Member.new
  end

  def create
    @member = Member.create(member_params)
    redirect_to members_path
  end

  def edit
    @member = Member.find(params[:id])
  end

  def update
    @member = Member.find(params[:id])
    @member.update(member_params)
    redirect_to members_path
  end

  # def destroy
  #   @member = Member.find(params[:id])
  #   @member.destroy
  #   flash[:notice] = 'Member deleted successfully'
  #   redirect_to members_path
  # end

  private
  def member_params
    params.require(:member).permit(:name, :email)
  end
end
