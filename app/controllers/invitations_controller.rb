# frozen_string_literal: true
class InvitationsController < ApplicationController
  before_action :authenticate_user!

  #for checking pending invitations of a particular user
  def index
    @user = current_user
    @pending = @user.pending_invitations
    @friends = Invitation.all.select{ |m| m.confirmed == true || (m.user_id == @user.id || m.friend_id == @user.id)}
  end

  #for creating invitation and sending mail to the friend
  def create
    id1 = params[:ids][:id1]
    id2 = params[:ids][:id2]
    @invitation = Invitation.new(user_id: id1, friend_id: id2)
    @invitation.save
    ConnectionMailer.with(user:User.find(id1), friend:User.find(id2)).connection_created.deliver_later
    redirect_to users_path
  end

  #for accepting invitation
  def accept
    @invitation = Invitation.find(params[:id])
    accept = @invitation.update(invite_params)
    redirect_to request.referrer
  end

  #for destroying invitation
  def destroy
    puts "destroy"
    puts params
    invitation = Invitation.find(params[:id])
    invitation.destroy
    redirect_to request.referrer
  end

  #for updating invitation
  def update
    invitation = Invitation.find(params[:invitation_id])
    puts current_user
    invitation.update(confirmed: true)
    redirect_to request.referrer
  end

  private
  #for permitting the required fields
  def invite_params
    params.permit(:friend_id,:confirmed)
  end
end

