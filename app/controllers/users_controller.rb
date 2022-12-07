# frozen_string_literal: true
class UsersController < ApplicationController
  before_action :authenticate_user!

  # for checking the role and make to visit to only on opposite role
  def index
    @mort_users = current_user.role == "Mortgagee" ? User.mortgagor : User.mortgagee
  end

  #for showing the particular user
  def show
    @user = User.find(params[:id])
  end
end


