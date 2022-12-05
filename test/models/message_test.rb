require "test_helper"
class MessageTest < ActiveSupport::TestCase

  def setup
    @message = Message.new(body: "Example User", conversation_id: 2)
  end

  test "body should be present" do
    @message.body = ""
    assert_not @message.valid?
  end

  test "conversation_id should be present" do
    @message.conversation_id = ""
    assert_not @message.valid?
  end
end
