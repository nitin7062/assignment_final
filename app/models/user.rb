class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable, :trackable


  has_many :invitations
  has_many :pending_invitations, ->{ where confirmed: false }, class_name: "Invitation", foreign_key: "friend_id"
  
  def friends
    friends_sent_invitation = Invitation.where(user_id: id, confirmed: true).pluck(:friend_id)
    friend_got_invitation = Invitation.where(friend_id: id, confirmed: true).pluck(:user_id)
    ids = friends_sent_invitation + friend_got_invitation
    User.where(id: ids)
  end

  def friend_with?(user)
    Invitation.confirmed_record?(id, user.id)
  end

  def send_invitation(user)
    invitations.create(friend_id: user.id)
  end

  def pending(user)
    @hii = Invitation.where(user_id: user.id, confirmed: false).pluck("friend_id")
    User.where(id: @hii)
  end

  def unco(user, friend)
    Invitation.find_by(user_id: user.id, friend_id: friend.id ,confirmed:false)
  end


end
