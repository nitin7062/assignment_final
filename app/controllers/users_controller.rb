class UsersController < ApplicationController
  def index
    @users = current_user.role
    if @users =="Mortgagee"
      @users= User.where.not(role:"Mortgagee")
    else
      @users =User.where(role:"Mortgagor")
    end
  end
end