# frozen_string_literal: true
class UsersController < ApplicationController
  before_action :authenticate_user!

  # for checking the role and make to visit to only on opposite role
  def index
    @users = current_user
    if @users.role =="Mortgagee"
      @mort_users= User.where(role:"Mortgagor")
    else
      @mort_users =User.where(role:"Mortgagee")
    end
  end

  #for showing the particular user
  def show
    @user = User.find(params[:id])
  end
end


