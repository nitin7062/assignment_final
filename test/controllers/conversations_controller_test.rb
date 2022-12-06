require "test_helper"
class ConversationsControllerTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:michael)
    @conversation = conversations(:one)
  end

  test "should get index" do
    sign_in @user
    get conversations_path
    assert_response :found
  end

  test "should get create" do
    sign_in @user
    post conversations_path(@user.id)
    assert_response :found
  end

  test "should redirect create when not logged in" do
    assert_no_difference 'Conversation.count' do
      post conversations_path,params: { conversation: { sender_id: @conversation.sender_id, receiver_id: @conversation.receiver_id} }
    end
    assert_redirected_to new_user_session_path
  end
end
