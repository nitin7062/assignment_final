# frozen_string_literal: true
class Invitation < ApplicationRecord
  belongs_to :user

  #for checking if the invitation has reaction
  def self.reacted?(id1, id2)
    case1 = !Invitation.where(user_id: id1, friend_id: id2).empty?
    case2 = !Invitation.where(user_id: id2, friend_id: id1).empty?
    case1 || case2
  end

  # for checking the invitation is confirmed or not
  def self.confirmed_record?(id1, id2)
    case1 = !Invitation.where(user_id: id1, friend_id: id2, confirmed: :true).empty?
    case2 = !Invitation.where(user_id: id2, friend_id: id1, confirmed: :true).empty?
    case1 || case2
  end

  #for finding the invitation
  def self.find_invitation(id1, id2)
    if Invitation.where(user_id: id1, friend_id: id2, confirmed: :true).empty?
      Invitation.where(user_id: id2, friend_id: id1, confirmed: :true)[0].id
    else
      Invitation.where(user_id: id1, friend_id: id2, confirmed: :true)[0].id
    end
  end
end
