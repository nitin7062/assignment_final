class UsersController < ApplicationController
  before_action :authenticate_user!
  def index
    @users = current_user
    if @users.role =="Mortgagee"
      @mort_users= User.where(role:"Mortgagor")
    else
      @mort_users =User.where(role:"Mortgagee")
    end
  end

  def show
    @user = User.find(params[:id])
  end

  # def destroy
  #   invitation = Invitation.find(params[:id])
  #   invitation.destroy
  #   redirect_to request.referrer
  # end
  # def pending(user)
  #   @hi= Invitation.joins("INNER JOIN users on users.id=invitations.friend_id").where(confirmed:false,user_id:user.id).select("users.first_name")
  # end
  # def pending(user)
  #   User.select(:first_name).joins(:invitations).where(invitations:{user_id: user.id, confirmed: false})
  # end
  # def pending
  #   @user == current_user
  #   @abc = Invitation.where(confirmed:"false", user_id: @user.id)
  end
