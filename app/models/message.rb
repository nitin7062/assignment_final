class Message < ActiveRecord::Base
  belongs_to :conversation

  validates_presence_of :body, :conversation_id

  def message_time
    created_at.strftime("%m/%d/%y at %l:%M %p")
  end
end