# frozen_string_literal: true
class Message < ActiveRecord::Base
  belongs_to :conversation

  validates_presence_of :body, :conversation_id

  #for displaying message of the format shown below for messages
  def message_time
    created_at.strftime("%m/%d/%y at %l:%M %p")
  end
end