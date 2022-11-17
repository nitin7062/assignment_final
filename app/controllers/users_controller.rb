class UsersController < ApplicationController
  before_action :authenticate_user!
  def index
    @users = current_user.role
    if @users =="Mortgagee"
      @users= User.where(role:"Mortgagor")
    else
      @users =User.where(role:"Mortgagee")
    end
  end

  def show
    @user = User.find(params[:id])
  end
end