# frozen_string_literal: true
class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable, :trackable
  scope :mortgagor, -> {where(role: "Mortgagor")}
  scope :mortgagee, -> {where(role: "Mortgagee")}
  validates :first_name, :email,:role, presence: true
  validates :email, presence:true, uniqueness:true
  has_many :invitations
  has_many :pending_invitations, ->{ where confirmed: false }, class_name: "Invitation", foreign_key: "friend_id"
  has_many :conversations
  has_many :messages
  after_create_commit { broadcast_append_to "users" }
  #for checking the friends
  def friends
    friends_sent_invitation = Invitation.where(user_id: id, confirmed: true).pluck(:friend_id)
    friend_got_invitation = Invitation.where(friend_id: id, confirmed: true).pluck(:user_id)
    ids = friends_sent_invitation + friend_got_invitation
    User.where(id: ids)
  end

  #for checking if a user is friend with another user
  def friend_with?(user)
    Invitation.confirmed_record?(id, user.id)
  end

  # whom is sending invitation
  def send_invitation(user)
    invitations.create(friend_id: user.id)
  end

  # for checking pending invitation with user
  def pending(user)
    @hii = Invitation.where(user_id: user.id, confirmed: false).pluck("friend_id")
    User.where(id: @hii)
  end

  #for finding the invitation which are not accepted yet
  def unco(user, friend)
    Invitation.find_by(user_id: user.id, friend_id: friend.id ,confirmed:false)
  end
end

