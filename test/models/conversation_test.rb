require "test_helper"

class ConversationTest < ActiveSupport::TestCase

  def setup
    @conversation = Conversation.new(sender_id:1, receiver_id: 2)
  end

  test "sender_id and receiver_id should be unique" do
    duplicate_conversation = @conversation.dup
    @conversation.save
    assert_not duplicate_conversation.valid?
  end
end
