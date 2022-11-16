class UsersController < ApplicationController
  # before_action :authenticate_user!
  def index
    @users = current_user.role
    if @users =="Mortgagee"
      @users= User.where.not(role:"Mortgagee")
    else
      @users =User.where(role:"Mortgagor")
    end
  end

  def show
    @user = User.find(params[:id])
  end
end