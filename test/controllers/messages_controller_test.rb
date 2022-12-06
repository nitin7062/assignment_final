require "test_helper"

class MessagesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @message = messages(:one)
    @user = users(:michael)
  end

  test "should get index" do
    sign_in(@user)
    get conversation_messages_path(@message.conversation_id)
    assert_response :found
  end

  test "should redirect create when not logged in" do
    assert_no_difference 'Message.count' do
      post conversation_messages_path(@message.conversation_id),params: { message: { body: "Lorem ipsum", user_id: @user.id} }
    end
    assert_redirected_to new_user_session_path
  end

  test "should get create" do
    sign_in @user
    post conversation_messages_path(@message.conversation_id),params: { message: { body: "Lorem ipsum", user_id: @user.id} }
    assert_response :found
  end
end